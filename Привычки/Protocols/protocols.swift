
protocol TestDelegate: class {
    func updCollection()
}

protocol ProtocolForCallFromCorrectToDetail: class {
    func callFromCorrectToDetailPopToRoot()
    func updateTitle(newTitle: String)
    func updateHabitsCollection()
}
