protocol Performer {
    
    func perform() throws -> String
}

final class MenuPerformer: Performer {
    
    func perform(shouldTrack: Bool = false) throws -> String {
     
        if shouldTrack {..}
        return "Menu"
    }
}

final class Tracker {
    
    func track(menu: String) {
        //....
    }
}

final class TrackingMenuPerformer: Performer {
    
    private let performer: Performer
    private let tracker: Tracker
    
    init(
        performer: Performer,
        tracker: Tracker
    ) {
        self.performer = performer
        self.tracker = tracker
    }
    
    func perform() throws -> String {
        
        let menu = try performer.perform()
        tracker.track(menu: menu)
        return menu
    }
}

// Decorator Pattern

final class TrackingMenuPerformerDecorator: Performer {
    
    private let decoratee: Performer
    private let tracker: Tracker
    
    init(
        decoratee: Performer,
        tracker: Tracker
    ) {
        self.decoratee = decoratee
        self.tracker = tracker
    }
    
    func perform() throws -> String {
        
        tracker.track(menu: "no menu")
        let menu = try decoratee.perform()
        tracker.track(menu: menu)
        return menu
    }
}

final class LoggingMenuPerformerDecorator: Performer {}
    

let menuPerformer = MenuPerformer()
let tracker = Tracker()
let trackingMenuPerformer = TrackingMenuPerformerDecorator(
    decoratee: menuPerformer,
    tracker: tracker
)

let loggingTrackingMenuPerformer = LoggingMenuPerformerDecorator(
    decoratee: TrackingMenuPerformerDecorator(
        decoratee: ____MenuPerformerDecorator(
            decoratee: menuPerformer,
            tracker: tracker
        )
,
        tracker: tracker
    )
,
    logger: logger
)
