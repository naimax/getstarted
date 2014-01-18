router = new geddy.RegExpRouter()

router.get("/").to "Main.index"
router.resource 'main'
exports.router = router

