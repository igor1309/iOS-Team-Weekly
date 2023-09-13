import Foundation

protocol Payment {
    
    func send(amount: Double)
}

final class MeToMe: Payment {
    
    func send(amount: Double) {
        
    }
}

final class PaymentSystem {
    
    var payments: [Payment] = []
}

let paymentSystem = PaymentSystem()
let meToMe = MeToMe()
paymentSystem.payments = [meToMe]

// Decorator
// - cross-cutting concern
// - - logging
// - - tracking

// time tracking
struct TimeTracker {
    
    func track(time: Date) {}
}

// Decorator
final class TimeTrackingPaymentDecorator: Payment {
    
    let decoratee: Payment
    let timeTracker: TimeTracker
    
    init(
        decoratee: Payment,
        timeTracker: TimeTracker
    ) {
        self.decoratee = decoratee
        self.timeTracker = timeTracker
    }
    
    func send(amount: Double) {
        
        timeTracker.track(time: .init())
        decoratee.send(amount: amount)
    }
}

let timeTracker = TimeTracker()
let decorator = TimeTrackingPaymentDecorator(decoratee: meToMe, timeTracker: timeTracker)
paymentSystem.payments = [decorator]
