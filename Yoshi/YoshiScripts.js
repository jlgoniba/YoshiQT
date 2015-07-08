function switchAnimation() {
    hideAllAnimations();
    yoshi.idleTimer.stop();
    switch(yoshi.state) {
    case "IDLE":
        yoshi.idleTimer.start();
//        yoshiAnimation.yoshiIdle.visible = true;
//        yoshiAnimation.yoshiIdle.start();
        break;
    case "WAITING":
//        yoshiAnimation.yoshiWaiting.visible = true;
//        yoshiAnimation.yoshiWaiting.start();
        break;
    case "WALKING":
//        yoshiAnimation.yoshiWalking.visible = true;
//        yoshiAnimation.yoshiWalking.start();
        break;
    case "JUMPING":
//        yoshiAnimation.yoshiJumping.visible = true;
//        yoshiAnimation.yoshiJumping.start();
        break;
    }
}

function hideAllAnimations() {
//    stopAllAnimations();
//    yoshiAnimation.yoshiWaiting.visible = false;
//    yoshiAnimation.yoshiWalking.visible = false;
//    yoshiAnimation.yoshiJumping.visible = false;
}

function stopAllAnimations() {
//    yoshiAnimation.yoshiIdle.stop();
//    yoshiAnimation.yoshiWaiting.stop();
//    yoshiAnimation.yoshiWalking.stop();
//    yoshiAnimation.yoshiJumping.stop();
}
