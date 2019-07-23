# CASSANDRA-15131

## Scenario

1. Remove node command comes  after CA cluster completes initialization

2. line\#6 is crash point, so we inject crash after it.

   ```
   1. if (!replicatingNodes.isEmpty() || !tokenMetadata.getLeavingEndpoints().isEmpty())
   2. {
   3.   logger.warn("Removal not confirmed for for {}", StringUtils.join(this.replicatingNodes, ","));
   4.   for (InetAddress endpoint : tokenMetadata.getLeavingEndpoints())
   5.   {
   6.      UUID hostId = tokenMetadata.getHostId(endpoint);
   7.      Gossiper.instance.advertiseTokenRemoved(endpoint, hostId);
   8.      excise(tokenMetadata.getTokens(endpoint), endpoint);
   10   }
   11   replicatingNodes.clear();
   12   removingNode = null;
   13 }
   ```

3. At code line#6, forceRemoveNode will get hostId , but if removeNode just remove the host just now, the  hostId at line6 will be null.

4. code line#7 will call **hostId.toString(),** hence NPE happens

5. If we have two or more nodes that should be force removed, this NPE will make them be skipped and still exist in cluster. 

## Trigger analysis

1. InetAddress  is the obvious meta-info,  so tokenMetadata is memory that manager meta-info.
2. And before it is read, we should crash the  node whose address equals InetAddress.