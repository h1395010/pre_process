dir=/home/matthias/Workbench/SUTD/nytimes_corpus
for f in $dir/NYTimesCorpus/*/*/*/*.xml; do
    [[ $f == *_output.xml ]] && continue # skip output files
    g="${f%.xml}_output.xml"
    java -mx600m \
         -cp $dir/NER/stanford-ner-2015-01-30/stanford-ner-3.5.1.jar \
         edu.stanford.nlp.ie.crf.CRFClassifier \
         -loadClassifier $dir/NER/stanford-ner-2015-01-30/classifiers/english.all.3class.distsim.crf.ser.gz \
         -textFile "$f" \
         -outputFormat inlineXML > "$g"
done
