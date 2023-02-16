// Game variables
let score = 0;
let gameover = false;

// Game objects
const player = {
  x: 0,
  y: 0,
  width: 50,
  height: 50
}

const enemy = {
  x: 200,
  y: 200,
  width: 50,
  height: 50
}

// Game canvas
const canvas = document.getElementById("game-canvas");
const ctx = canvas.getContext("2d");

// Event listener for player movement
document.addEventListener("keydown", function(event) {
  if (event.code === "ArrowUp") {
    player.y -= 10;
  } else if (event.code === "ArrowDown") {
    player.y += 10;
  } else if (event.code === "ArrowLeft") {
    player.x -= 10;
  } else if (event.code === "ArrowRight") {
    player.x += 10;
  }
});

// Game loop
function gameLoop() {
  // Clear canvas
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  // Draw player
  ctx.fillStyle = "blue";
  ctx.fillRect(player.x, player.y, player.width, player.height);

  // Draw enemy
  ctx.fillStyle = "red";
  ctx.fillRect(enemy.x, enemy.y, enemy.width, enemy.height);

  // Check for collision
  if (player.x < enemy.x + enemy.width &&
      player.x + player.width > enemy.x &&
      player.y < enemy.y + enemy.height &&
      player.y + player.height > enemy.y) {
    gameover = true;
  }

  // Update score
  if (!gameover) {
    score++;
  }

  // Game over
  if (gameover) {
    ctx.fillStyle = "white";
    ctx.font = "bold 32px Arial";
    ctx.fillText("Game Over!", canvas.width/2 - 100, canvas.height/2);
    ctx.fillText("Score: " + score, canvas.width/2 - 100, canvas.height/2 + 40);
  } else {
    // Continue game loop
    window.requestAnimationFrame(gameLoop);
  }
}

// Start game loop
window.requestAnimationFrame(gameLoop);