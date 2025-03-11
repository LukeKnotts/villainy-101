extends TextureRect

const blockSize = 48
const blockpadding = 2
func _ready():
	var sizex = self.size[0]
	var sizey = self.size[0]
	
	var spawnX = (sizex)/(blockSize+blockpadding)
	var spawnY = (sizey)/(blockSize+blockpadding)



	for y in range(spawnY):
		for x in range(spawnX):
			var texture = TextureRect.new()
			texture.set_texture(CanvasTexture.new())
			texture.size[0] = blockSize
			texture.size[1] = blockSize
			texture.position[0] = (blockSize+blockpadding)*x
			texture.position[1] = (blockSize+blockpadding)*y

			add_child(texture)
