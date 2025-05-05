[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Item_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "ItemId", DestinationColumnName = "ItemId"], [SourceColumnName = "Name", DestinationColumnName = "Name"], [SourceColumnName = "BrandId", DestinationColumnName = "BrandId"], [SourceColumnName = "CategoryId", DestinationColumnName = "CategoryId"], [SourceColumnName = "SubCategoryId", DestinationColumnName = "SubCategoryId"], [SourceColumnName = "Brand", DestinationColumnName = "Brand"], [SourceColumnName = "Category", DestinationColumnName = "Category"], [SourceColumnName = "SubCategory", DestinationColumnName = "SubCategory"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Item = let
  Source = Excel.Workbook(Web.Contents("https://github.com/amitchandakpbi/powerbi/raw/refs/heads/main/Sales%20Data%20for%20Fabric.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "Item", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"ItemId", Int64.Type}, {"Name", type text}, {"BrandId", Int64.Type}, {"CategoryId", Int64.Type}, {"SubCategoryId", Int64.Type}, {"Brand", type text}, {"Category", type text}, {"SubCategory", type text}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Customer_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "CustomerId", DestinationColumnName = "CustomerId"], [SourceColumnName = "Age", DestinationColumnName = "Age"], [SourceColumnName = "City", DestinationColumnName = "City"], [SourceColumnName = "State", DestinationColumnName = "State"], [SourceColumnName = "Name", DestinationColumnName = "Name"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Customer = let
  Source = Excel.Workbook(Web.Contents("https://github.com/amitchandakpbi/powerbi/raw/refs/heads/main/Sales%20Data%20for%20Fabric.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "Customer", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"CustomerId", Int64.Type}, {"Age", Int64.Type}, {"City", type text}, {"State", type text}, {"Name", type text}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Sales_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "OrderNo", DestinationColumnName = "OrderNo"], [SourceColumnName = "ItemID", DestinationColumnName = "ItemID"], [SourceColumnName = "SalesDate", DestinationColumnName = "SalesDate"], [SourceColumnName = "DeilveryDate", DestinationColumnName = "DeilveryDate"], [SourceColumnName = "CustomerId", DestinationColumnName = "CustomerId"], [SourceColumnName = "CityId", DestinationColumnName = "CityId"], [SourceColumnName = "Qty", DestinationColumnName = "Qty"], [SourceColumnName = "Price", DestinationColumnName = "Price"], [SourceColumnName = "cost", DestinationColumnName = "cost"], [SourceColumnName = "DiscountPercent", DestinationColumnName = "DiscountPercent"], [SourceColumnName = "Gross Amount", DestinationColumnName = "Gross Amount"], [SourceColumnName = "COGS Amount", DestinationColumnName = "COGS Amount"], [SourceColumnName = "DiscountAmount", DestinationColumnName = "DiscountAmount"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Sales = let
  Source = Excel.Workbook(Web.Contents("https://github.com/amitchandakpbi/powerbi/raw/refs/heads/main/Sales%20Data%20for%20Fabric.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "Sales", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"OrderNo", Int64.Type}, {"ItemID", Int64.Type}, {"SalesDate", type date}, {"DeilveryDate", type date}, {"CustomerId", Int64.Type}, {"CityId", Int64.Type}, {"Qty", Int64.Type}, {"Price", Int64.Type}, {"cost", Int64.Type}, {"DiscountPercent", Int64.Type}}),
  #"Added custom" = Table.TransformColumnTypes(Table.AddColumn(#"Changed column type", "Gross Amount", each [Qty] * [Price]), {{"Gross Amount", type number}}),
  #"Added custom 1" = Table.TransformColumnTypes(Table.AddColumn(#"Added custom", "COGS Amount", each [Qty] * [cost]), {{"COGS Amount", type number}}),
  #"Added custom 2" = Table.TransformColumnTypes(Table.AddColumn(#"Added custom 1", "DiscountAmount", each [Gross Amount] * [DiscountPercent] / 100), {{"DiscountAmount", type number}})
in
  #"Added custom 2";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Geography_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "CityId", DestinationColumnName = "CityId"], [SourceColumnName = "City", DestinationColumnName = "City"], [SourceColumnName = "State", DestinationColumnName = "State"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Geography = let
  Source = Excel.Workbook(Web.Contents("https://github.com/amitchandakpbi/powerbi/raw/refs/heads/main/Sales%20Data%20for%20Fabric.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "Geography", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"CityId", Int64.Type}, {"City", type text}, {"State", type text}})
in
  #"Changed column type";
shared Item_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "f14fb2d1-b48e-4537-9775-a8e98df3a9b1"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "b195dbbd-02ff-48ac-a5c1-b2447394f7f3"]}[Data],
  TableNavigation = Navigation_2{[Item = "Item", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
shared Customer_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "f14fb2d1-b48e-4537-9775-a8e98df3a9b1"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "b195dbbd-02ff-48ac-a5c1-b2447394f7f3"]}[Data],
  TableNavigation = Navigation_2{[Item = "Customer", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
shared Sales_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "f14fb2d1-b48e-4537-9775-a8e98df3a9b1"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "b195dbbd-02ff-48ac-a5c1-b2447394f7f3"]}[Data],
  TableNavigation = Navigation_2{[Item = "Sales", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
shared Geography_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "f14fb2d1-b48e-4537-9775-a8e98df3a9b1"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "b195dbbd-02ff-48ac-a5c1-b2447394f7f3"]}[Data],
  TableNavigation = Navigation_2{[Item = "Geography", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
