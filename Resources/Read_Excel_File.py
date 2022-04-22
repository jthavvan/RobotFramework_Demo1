from RPA.Excel.Files import Files
from RPA.Tables import Tables
#excel="testdata/OrangeData.xlsx"
def get_orders(excel):
    files = Files()
    workbook = files.open_workbook(excel)
    rows = workbook.read_worksheet(header=True)

    tables = Tables()
    table = tables.create_table(rows)
    tables.filter_empty_rows(table)

    orders = []
    for row in table:
        order = {
            "first_name": row["username"],
            "last_name": row["password"],
            "error_msg": row["error_msg"]
        }
        orders.append(order)

    return orders
x=get_orders("C:\RobotFramework_Training\RobotFramework_Demo1\TestData\weborders_login1.xls")
print(x)