from PY_ServidorGB_Servidores import BrokerServer, ServerOption
from PY_ServidorGB_Jogo import FunctionRestrict, GameServer, User
import threading
import json


def load_broker_directory_from_file():
    # List of servers to be broadcast by the broker server
    server_options = []
    with open("Temporarios\TXT_Servidores.txt") as directory_data_text:
        directory_data = json.load(directory_data_text)
        for json_row in directory_data["server_options"]:
            server_options.append(ServerOption(json_row["server_name"], json_row["server_description"], json_row["server_address"], json_row["server_port"], json_row["server_utilization"], json_row["server_capacity"], json_row["server_enabled"]))
    return server_options


if __name__ == "__main__":
    world_session = []
    world_room = []
    world_user = User.get_users(0)
    broker_options = []
    bind_address = "0.0.0.0"
    enabled_server_functions = [
    FunctionRestrict.AVATAR_ENABLED,
    FunctionRestrict.EFFECT_FORCE,
    FunctionRestrict.EFFECT_TORNADO,
    FunctionRestrict.EFFECT_LIGHTNING,
    FunctionRestrict.EFFECT_WIND,
    FunctionRestrict.EFFECT_THOR,
    FunctionRestrict.EFFECT_MOON,
    FunctionRestrict.EFFECT_ECLIPSE
    #FunctionRestrict.EVENT1_ENABLE,
    #FunctionRestrict.EVENT2_ENABLE,
    #FunctionRestrict.EVENT3_ENABLE,
    #FunctionRestrict.EVENT4_ENABLE
    ]


    broker_options = load_broker_directory_from_file()

    broker_server = BrokerServer(bind_address, 8372, broker_options, world_session)
    threading.Thread(target=broker_server.listen).start()

    game_server: GameServer = GameServer(bind_address, 8370, world_session, world_room, world_user)
    game_server.gs_funcrestrict = FunctionRestrict.get_function_value(enabled_server_functions)
    threading.Thread(target=game_server.listen).start()
