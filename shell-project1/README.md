# PROGRAMMING PROJECT 1
Kendisine komut satırından iki argüman (parametre) alan bir kabuk programı (script) yazılmalıdır. Birinci argüman tam veya bağıl yolu ile tarif edilen bir düzyazı dosya, ikinci argüman ise pozitif bir tam sayı olmalıdır. Program ikinci argüman kadar dosya oluşturarak birinci argüman içerisindeki verileri olabildiğince eşit bir şekilde bu dosyaların içerisine dağıtmalıdır.

Örneğin birinci argüman *Turkish.dic* adında ve *100* satır içeren bir dosya, ikinci argüman da *4* olsun. Bu durumda *Turkish-1.dic*, *Turkish-2.dic*, *Turkish-3.dic* ve *Turkish-4.dic* adında 4 yeni dosya oluşturulmalıdır. Bu durumda *Turkish-1.dic* isimli birinci dosyanın içerisine *Turkish.dic* dosyasının ilk 25 satırı aktarılmalıdır. Benzer şekilde *Turkish-2.dic* isimli ikinci dosyanın içerisine *Turkish.dic* dosyasının ikinci gruptaki 25 satır, yani 26 ile 50. satırlar yönlendirilmelidir. (*Turkish.dic* isimli örnek bir dosya proje klasörü içerisinde yer almaktadır.)

Anlaşılacağı üzere birinci argüman içindeki satır sayısı ikinci argümana tam bölünüyorsa veri eşit olarak paylaştırılabilmektedir. Tam bölünemiyorsa dosyalardan bazıları diğerlerinden fazla veri içermek zorundadır. Yazılan program bu duruma dikkat etmeli ve verileri dosyalara olabildiğince eşit bir şekilde dağıtmalıdır. Bu amaçla geliştirilen algoritmanın çalışma prensibi scriptin en üst bölümüne (**#!/bin/bash** satırının altına) açıklama satırı olarak eklenmelidir.

- Program komut satırından girilen argüman sayısı 2 değilse bir uyarı vererek sonlanmalıdır.
- Program komut satırından girilen birinci argümanı, yani içeriği paylaştırılacak dosyayı bulamazsa bir uyarı vererek sonlanmalıdır.
- Program komut satırından girilen ikinci argüman pozitif bir tam sayı değilse bir uyarı vererek sonlanmalıdır.
- Program komut satırından girilen ikinci argümanın değeri birinci argüman içerisindeki satır sayısından büyükse bir uyarı vererek sonlanmalıdır.

Yazılan bu script komut satırında aşağıdaki şekillerde çalıştırılabilir:
```
$ ./Proje1.sh ./Turkish.dic 10
$ ./Proje1.sh /home/user/files/Turkish.dic 20
```