(ns basic-files.core)

(def tasks [{:title "Add Clojure fixture" :status :doing}
            {:title "Check highlighting" :status :todo}])

(frequencies (map :status tasks))
