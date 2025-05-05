# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "474c4f50-49c6-4dab-973b-98dbeca5ea68",
# META       "default_lakehouse_name": "DemoLakehouse",
# META       "default_lakehouse_workspace_id": "f14fb2d1-b48e-4537-9775-a8e98df3a9b1",
# META       "known_lakehouses": [
# META         {
# META           "id": "474c4f50-49c6-4dab-973b-98dbeca5ea68"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

import pandas as pd

df = pd.read_csv("https://github.com/amitchandakpbi/powerbi/raw/refs/heads/main/csv/retailData_fabric.csv")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark",
# META   "editable": true
# META }

# CELL ********************

df['Gross'] = df['qty'] * df['unit_price']
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df.to_csv("abfss://DemoFabricWorkspace@onelake.dfs.fabric.microsoft.com/DemoLakehouse.Lakehouse/Files/Retail1.csv")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df.to_parquet("abfss://DemoFabricWorkspace@onelake.dfs.fabric.microsoft.com/DemoLakehouse.Lakehouse/Files/Retail2.parquet")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df1 = spark.read.parquet("abfss://DemoFabricWorkspace@onelake.dfs.fabric.microsoft.com/DemoLakehouse.Lakehouse/Files/Retail2.parquet")
df1.write.mode("overwrite").format("delta").saveAsTable("Retail2_table")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

#Alternate way to creat delta table from pandas dataframe without staging it to a file and then reading
df1 = spark.createDataFrame(df)
df1.write.mode("overwrite").format("delta").saveAsTable("retail_club4_tab")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
