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

# Welcome to your new notebook
# Type here in the cell editor to add code!
import pandas as pd
from sklearn.cluster import KMeans
dfData = pd.read_csv("abfss://DemoFabricWorkspace@onelake.dfs.fabric.microsoft.com/DemoLakehouse.Lakehouse/Files/Retail1.csv")
display(dfData)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Select the three columns for clustering
columns_for_clustering = ['unit_price','discount_percent','unit_cost']
X = dfData[columns_for_clustering]
# display(X)
kmeans = KMeans(n_clusters = 5)
kmeans.fit(X)
dfData['cluster'] = kmeans.labels_
display(dfData)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

dfData.to_csv("abfss://DemoFabricWorkspace@onelake.dfs.fabric.microsoft.com/DemoLakehouse.Lakehouse/Files/Retail_club6.csv")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# This code did not work
#del dfData[columns[0]]
# Below worked. Drop the first column from Pandas dataframe
del dfData["Unnamed: 0"]
display(dfData)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Another way tried and worked when "del dfData[columns[0]]" in the above code cell did not work 
# convert pandas dataframe to Spark dataframe
dfSpark = spark.createDataFrame(dfData)
#display(dfSpark)
#dfSpark.printSchema()
# drop the first column
dfRemovedFirstCol = dfSpark.drop("Unnamed: 0")
display(dfRemovedFirstCol)
dfRemovedFirstCol.write.mode("overwrite").format("delta").saveAsTable("retail_club6_tab")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
