import src.db.connect as db
from src.requests.utilities import Check

def get_all(field: str):
    field = Check.field(field)
    if (field.startswith("ERROR")):
        return field;

    query = "SELECT id, nombre FROM " + field
    return db.cursor.execute(query).fetchall()

def get_from_type(field: str, type_id: str):
    field = Check.field(field)
    if (field.startswith("ERROR")):
        return field;

    type_id = Check.id(field, type_id)
    if (type_id.startswith("ERROR")):
        return type_id;

    query = ""

    if (field == "types"):
        query = "\n".join([
            "SELECT types.id, types.nombre",
            "FROM types, hierarchy_types",
            "WHERE hierarchy_types.type_inferior_id = types.id AND",
            type_id + " = hierarchy_types.type_superior_id;"
        ])
    elif (field == "polymers"):
        query = "\n".join([
            "SELECT polymers.id, polymers.nombre",
            "FROM polymers, polymers_types",
            "WHERE polymers_types.polymer_id = polymers.id AND",
            type_id + " = polymers_types.type_id;"
        ])

    return db.cursor.execute(query).fetchall()
