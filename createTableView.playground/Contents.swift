//: Playground - noun: a place where people can play

import Cocoa

let array : Array =
[("Address", "UITableViewCell"),
    ("Square" , "UITableViewCell"),
    ("Route" , "UITableViewCell"),
    ("Equipment" , "UITableViewCell"),
    ("Price" , "UITableViewCell"),
    ("Tax" , "UITableViewCell"),
    ("CalculateLoan" , "UITableViewCell"),
    ("EstimatePrice" , "UITableViewCell"),
    ("Call" , "UITableViewCell"),
]

let arrayCellType = [String]()
var setCellType = Set<String>()
for i in array {
    setCellType.insert(i.1)
}

let willDisplayCell = "willDisplayCell"
print("private var \(willDisplayCell) = [CellType]()")

print("enum CellType: Int { \n")

for item in array {
    print("\tcase \(item.0)")
}

print("\t case All" +
    "\n\tfunc reuseIdentifier() -> String {" +
    " \n\t\t switch self {"
)

for item in array {
    print("\t\t case .\(item.0):" +
        "\n \t\t\t return \"\(item.1)\""
    )
}



print("\t\t default:\n \t\t\t return \"\"\n\t\t}\n\t}\n}")
// tableView

print("\nprivate func setup\(willDisplayCell)() {" +
    "\n\t\(willDisplayCell) = []" +
    "\n\tfor i in 0 ..< CellType.All.rawValue {" +
    "\n\t\t if let cellType = CellType(rawValue: i) {" +
    "\n\t\t\tswitch cellType {")

for i in array {
    print ("\t\t\tcase .\(i.0):" +
        "\n\t\t\t\tif <#conditionToRemove#> {" +
        "\n\t\t\t\t\t continue" +
        "\n\t\t\t\t}"
    )
}
print("\t\t\tdefault: \n\t\t\t\t break")
print("\t\t\t}")
print("\t\t\t\(willDisplayCell) += [cellType]")
print("\n\t\t}\n\t}\n}\n")


print("func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {" +
    "\n\treturn \(willDisplayCell).count" +
    "\n}\n")

print("func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {" +
    "\n\tlet cellType = \(willDisplayCell)[indexPath.row]" +
    "\n\tlet cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellType.reuseIdentifier(), forIndexPath: indexPath)" +
    "\n\tswitch cellType {"
)

for i in array {
    print("\tcase .\(i.0):" +
        "\n\t\tlet cell = cell as! \(i.1) " +
        "\n\t\tconfig\(i.0)Cell(cell, indexPath: indexPath)"
    )
}

print("\tdefault: \n\t\tbreak")
print("\t}\n\treturn cell \n}\n")
/*for i in setCellType {
print("private func configCell(cell: \(i), indexPath: NSIndexPath) {" +
"\n\t<#code#> \n}"
)
}*/

for i in array {
    print("private func config\(i.0)Cell(cell: \(i.1), indexPath: NSIndexPath) {" +
        "\n\t<#code#> \n}"
    )
}





