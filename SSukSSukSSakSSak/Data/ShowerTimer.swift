/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

/// Keeps time for a daily scrum meeting. Keep track of the total meeting time, the time for each Showerer, and the name of the current Showerer.

@MainActor
final class ShowerTimer: ObservableObject {
    /// A struct to keep track of meeting bodies during a meeting.
    struct Showerer: Identifiable {
        /// The Bodies name.
        let name: String
        /// True if the Bodies has completed their turn to speak.
        var isCompleted: Bool
        /// Id for Identifiable conformance.
        let id = UUID()
    }
    
    /// The name of the meeting Bodies who is speaking.
    @Published var activeShowerer = ""
    /// The number of seconds since the beginning of the meeting.
    @Published var secondsElapsed = 0
    /// The number of seconds until all bodies have had a turn to speak.
    @Published var secondsRemaining = 0
    /// All meeting bodies, listed in the order they will speak.
    private(set) var showerers: [Showerer] = []

    /// The scrum meeting length.
    private(set) var lengthInMinutes: Int
    /// A closure that is executed when a new Bodies begins speaking.
    var showererChangedAction: (() -> Void)?

    private weak var timer: Timer?
    private var timerStopped = false
    private var frequency: TimeInterval { 1.0 / 60.0 }
    private var lengthInSeconds: Int { lengthInMinutes * 60 }
    private var secondsPerShowerer: Int {
        (lengthInMinutes * 60) / showerers.count
    }
    private var secondsElapsedForShowerer = 0
    private var showererIndex: Int = 0
    private var showererText: String {
        return "Showerer \(showererIndex + 1): " + showerers[showererIndex].name
    }
    private var startDate: Date?
    
    /**
     Initialize a new timer. Initializing a time with no arguments creates a ShowerTimer with no bodies and zero length.
     Use `startScrum()` to start the timer.
     
     - Parameters:
        - lengthInMinutes: The meeting length.
        -  bodies: A list of bodies for the meeting.
     */
    init(lengthInMinutes: Int = 0, bodies: [DailyShower.Bodies] = []) {
        self.lengthInMinutes = lengthInMinutes
        self.showerers = bodies.showerers
        secondsRemaining = lengthInSeconds
        activeShowerer = showererText
    }
    
    /// Start the timer.
    func startShower() {
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) { [weak self] timer in
            self?.update()
        }
        timer?.tolerance = 0.1
        changeToShowerer(at: 0)
    }
    
    /// Stop the timer.
    func stopShower() {
        timer?.invalidate()
        timerStopped = true
    }
    
    /// Advance the timer to the next Showerer.
    nonisolated func skipShowerer() {
        Task { @MainActor in
            changeToShowerer(at: showererIndex + 1)
        }
    }

    private func changeToShowerer(at index: Int) {
        if index > 0 {
            let previousShowererIndex = index - 1
            showerers[previousShowererIndex].isCompleted = true
        }
        secondsElapsedForShowerer = 0
        guard index < showerers.count else { return }
        showererIndex = index
        activeShowerer = showererText

        secondsElapsed = index * secondsPerShowerer
        secondsRemaining = lengthInSeconds - secondsElapsed
        startDate = Date()
    }

    nonisolated private func update() {

        Task { @MainActor in
            guard let startDate,
                  !timerStopped else { return }
            let secondsElapsed = Int(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970)
            secondsElapsedForShowerer = secondsElapsed
            self.secondsElapsed = secondsPerShowerer * showererIndex + secondsElapsedForShowerer
            guard secondsElapsed <= secondsPerShowerer else {
                return
            }
            secondsRemaining = max(lengthInSeconds - self.secondsElapsed, 0)

            if secondsElapsedForShowerer >= secondsPerShowerer {
                changeToShowerer(at: showererIndex + 1)
                showererChangedAction?()
            }
        }
    }
    
    /**
     Reset the timer with a new meeting length and new bodies.
     
     - Parameters:
         - lengthInMinutes: The meeting length.
         - bodies: The name of each Bodies.
     */
    func reset(lengthInMinutes: Int, bodies: [DailyShower.Bodies]) {
        self.lengthInMinutes = lengthInMinutes
        self.showerers = bodies.showerers
        secondsRemaining = lengthInSeconds
        activeShowerer = showererText
    }
}


extension Array<DailyShower.Bodies> {
    var showerers: [ShowerTimer.Showerer] {
        if isEmpty {
            return [ShowerTimer.Showerer(name: "Showerer 1", isCompleted: false)]
        } else {
            return map { ShowerTimer.Showerer(name: $0.name, isCompleted: false) }
        }
    }
}
