# used to create sub class cards (e.g. attack card, heal card, etc.)
@abstract
class_name CardData
extends Resource


@export var display_name: String
@export var cost: int = 1
@export var icon: Texture2D

# Returns the description that is displayed on the card
@abstract
func get_description() -> String

# Called when the player drags the card up and releases to cast
# Called when the enemy casts the card on their turn
@abstract
func cast(data: CastData)

@abstract
func get_value() -> int

# Since CardData is a Resource, it can't access the game state
# So we must send over all of the ifno it needs to perform a cast
class CastData:
    var caster: Character
    var opponent: Character
