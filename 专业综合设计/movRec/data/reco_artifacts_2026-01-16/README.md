# Reco Artifacts

## Collections
- item_sim_topk: {_id: movieId, sims:[{mid, sim, cu}], updatedAt}
- movies (optional): {_id: movieId, title, genres}

## Import
mongoimport --uri "<MONGO_URI>" --collection item_sim_topk --drop --file item_sim_topk.jsonl
mongoimport --uri "<MONGO_URI>" --collection movies --drop --file movies.jsonl
