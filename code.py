# -*- coding: utf-8 -*-
"""
Created on Wed Dec  9 14:34:27 2015

@author: jrco
"""
from Bio import SeqIO
from Bio.Blast import NCBIWWW
from Bio.Blast import NCBIXML
import re

class LabBioInfG2:

    def __init__(self):
        self.record = ""

    #Read GenBank file to string
    def readGenBank(self, file):
        self.record = SeqIO.read(file,"gb")

    #Process Sequence to generate the "output.xml" with the extrated information from GenBank file
    #This function use the import re to find all the patterns
    def processSequence(self, file):
        self.readGenBank(file)
        cont = 1;
        file=open('./output.xml', 'w+')
        file.write('<?xml version="1.0" encoding="UTF-8"?>')
        file.write("<genes>")
        print("Record ID:" , self.record.id)
        for i in range(1,len(self.record.features)):
            if self.record.features[i].type == "CDS":
                r= str(self.record.features[i])
                file.write('<gene id="'+str(cont)+'">')
                print('<gene id="'+str(cont)+'">')

                aux = str(re.findall("Key: EC_number, Value: \[\'.+\'\]",r))
                ecNumber = aux[len("Key: EC_number, Value: \[\'")+1:len(aux)-4]
                print("<ecNumber>"+ ecNumber +"</ecNumber>")
                file.write("<ecNumber>"+ ecNumber +"</ecNumber>")

                aux = str(re.findall("GeneID:[0-9]+",r))
                geneID = aux[len("GeneID\:")+1:len(aux)-2]
                print("<geneID>"+ geneID +"</geneID>")
                file.write("<geneID>"+ geneID +"</geneID>")

                aux = str(re.findall("Key: inference, Value: \[\'EXISTENCE: similar to AA sequence:SwissProt:.+\'\]",r))
                swissprot = aux[len("Key: inference, Value: ['EXISTENCE: similar to AA sequence:SwissProt:")+2:len(aux)-4]
                print("<swissprot>"+ swissprot + "</swissprot>")
                file.write("<swissprot>"+ swissprot + "</swissprot>")

                aux = str(re.findall("Key: locus_tag, Value: \[\'.+\'\]",r))
                locus_tag = aux[len("Key: locus_tag, Value: \[\'")+1:len(aux)-4]
                print("<locus-tag>"+ locus_tag + "</locus-tag>")
                file.write("<locus-tag>"+ locus_tag + "</locus-tag>")

                aux = str(re.findall("Key: product, Value: \[\'.+\'\]",r))
                product = aux[len("Key: product, Value: \[\'")+1:len(aux)-4]
                print("<product>"+ product + "</product>")
                file.write("<product>"+ product + "</product>")

                aux = str(re.findall("Key: protein_id, Value: \[\'.+\'\]",r))
                proteinID = aux[len("Key: protein_id, Value: \[\'")+1:len(aux)-4]
                print("<proteinID>"+ proteinID + "</proteinID>")
                file.write("<proteinID>"+ proteinID + "</proteinID>")

                aux = str(re.findall("location: \[.+\:.+\]\\([+-]\)",r))
                strand=""
                for i in range(len(aux)):
                    if aux[i]=='(':
                        strand=aux[i+1]
                print("<strand>"+ strand+ "1</strand>")
                file.write("<strand>"+ strand + "1</strand>")

                aux = str(re.findall("Key: note, Value\: \[\'.+\'\]",r))
                note = aux[len("Key: note, Value\: \[\'")+1:len(aux)-4]
                print("<note>"+ note + "</note>")
                file.write("<note>"+ note + "</note>")

                aux = str(re.findall("Key: translation, Value: \[\'.+\'\]",r))
                sequence = aux[len("Key: translation, Value: \[\'")+1:len(aux)-4]
                print("<sequence>"+ sequence + "</sequence>")
                file.write("<sequence>"+ sequence + "</sequence>")

                size = 0
                for i in range(len(sequence)):
                    size+=1
                print("<lensequence>"+ str(size) + "</lensequence>")
                file.write("<lensequence>"+ str(size) + "</lensequence>")

                cont = cont + 1
                file.write("</gene>")
        file.write("</genes>")
        file.close();

    #This function read the file "seq.txt" with sequence and realize the blast
    def blast_seq(self):
        myseq = ">gi\n"
        record = open("seq.txt","r")
        for line in record:
            myseq += line

        result= NCBIWWW.qblast("blastp", "swissprot", myseq )
        save = open("my_blast.xml", "w")
        save.write(result.read())
        save.close()
        result.close()

    #This function open the result file (blast_result function) and parse your content
    def blast_result(self):
        file=open('./blast_result.txt', 'w+')
        cont = 0
        result=open("my_blast.xml")
        blast_records = NCBIXML.parse(result)
        for blast_record in blast_records:
            for alignment in blast_record.alignments:
                cont+=1
                if cont > 11:
                    break
                if cont >0:
                    for hsp in alignment.hsps:
                        print ('\n\n**********Alignment ' + str(cont) + '**********\n' )
                        file.write('\n\n\n**********Alignment ' + str(cont) + '**********\n')
                        print ("Organism:\n"+ alignment.hit_def)
                        file.write("\n-------Organism-------\n"+ str(alignment.hit_def))
                        print ('E_value:\n' , hsp.expect)
                        file.write('\n-------E_value-------\n'+ str(hsp.expect))
                        print ('Accession:\n', alignment.accession)
                        file.write('\n-------Accession-------\n'+ str(alignment.accession))
                        print ('Score:\n', hsp.score)
                        file.write('\n-------Score-------\n'+ str(hsp.score))
                        print ('Query:\n', hsp.query)
                        file.write('\n-------Query-------\n'+ str(hsp.query))
                        print ('Subject\n', hsp.sbjct)
                        file.write('\n-------Subject-------\n'+ str(hsp.sbjct))
        file.close();

#Teste function
def test():
    proj = LabBioInfG2()
    file2 = "seq.txt"
    proj.blast_seq(file2)
    proj.blast_result()

if __name__ == '__main__':
    test()
