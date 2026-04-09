---
title: Transforming XML with XSLT
slug: Web/XML/XSLT/Guides/Transforming_XML_with_XSLT
page-type: guide
sidebar: xmlsidebar
---

Sự tách biệt giữa nội dung và trình bày là một đặc điểm thiết kế quan trọng của [XML](/en-US/docs/Web/XML). Cấu trúc của một tài liệu XML được thiết kế để phản ánh và làm rõ các mối quan hệ quan trọng giữa từng khía cạnh của chính nội dung đó, không bị cản trở bởi nhu cầu phải cung cấp bất kỳ dấu hiệu nào về cách dữ liệu này cuối cùng sẽ được trình bày. Việc cấu trúc thông minh như vậy đặc biệt quan trọng khi ngày càng nhiều quá trình truyền dữ liệu được tự động hóa và diễn ra giữa các máy rất khác nhau được kết nối qua mạng.

Tuy nhiên, cuối cùng thì phần lớn nội dung được lưu trong các tài liệu XML sẽ cần được trình bày cho người đọc. Vì trình duyệt cung cấp một giao diện quen thuộc và rất linh hoạt, nó là cơ chế lý tưởng để cung cấp các phiên bản trình bày như vậy của nội dung XML. Được xây dựng từ đầu bằng cách tận dụng nhiều công nghệ XML khác nhau, Firefox tự nó bao gồm tất cả các cơ chế cần thiết để xử lý cả tài liệu XML gốc lẫn các stylesheet chuyên biệt dùng để tạo kiểu và bố trí chúng cho việc hiển thị HTML, qua đó giảm tải cho máy chủ bằng cách xử lý ở phía client.

Hiện tại, Gecko (bộ máy bố cục phía sau Firefox) hỗ trợ hai dạng XML stylesheet. Để kiểm soát cơ bản về giao diện - font, màu sắc, vị trí, v.v. - Gecko dùng [CSS](/en-US/docs/Web/CSS).

Trọng tâm của chúng ta ở đây là loại stylesheet thứ hai mà Gecko hỗ trợ: XSLT stylesheet. XSLT là viết tắt của eXtensible Stylesheet Language/Transform, và cái tên này rất phù hợp. XSLT cho phép tác giả stylesheet biến đổi một tài liệu XML chính theo hai cách quan trọng: thao tác và sắp xếp lại nội dung, bao gồm cả việc sắp xếp lại toàn bộ nếu muốn, và chuyển đổi nội dung sang một định dạng khác (và trong trường hợp của Firefox, trọng tâm là chuyển đổi nhanh sang HTML để trình duyệt có thể hiển thị).

## XSLT là gì?

eXtensible Stylesheet Language/Transform là một ngôn ngữ rất mạnh, và việc thảo luận đầy đủ về nó vượt xa phạm vi của bài viết này, nhưng một cuộc thảo luận ngắn về một số khái niệm cơ bản sẽ giúp ích cho việc hiểu phần mô tả về các khả năng của Netscape sau đây.

XSLT stylesheet là một tài liệu XML. Không giống CSS, vốn có cú pháp chuyên biệt riêng, XSLT stylesheet là một tài liệu XML, và phải tuân theo mọi quy tắc XML, bao gồm cả tính well-formed. Vì vậy, mô hình của phép biến đổi là một tài liệu XML được dùng để biến đổi một tài liệu XML khác.

XSLT stylesheet được đánh dấu như vậy bằng việc bao gồm một phần đầu XSLT chuẩn. Phần tử ngoài cùng của một XSLT stylesheet phải là phần tử `<xsl:stylesheet>` (một lựa chọn thay thế chấp nhận được là phần tử `<xsl:transform>`). Phần tử này sẽ bao gồm ít nhất một khai báo namespace và thuộc tính version bắt buộc. Các namespace khác và ba thuộc tính tùy chọn cũng có thể được bao gồm.

## Namespace XSLT

Namespace bắt buộc cho XSLT là `"http://www.w3.org/1999/XSL/Transform"`. Namespace là một chủ đề gây khá nhiều nhầm lẫn trong XML. Mặc dù rất thường xuyên namespace trông giống như URI, nhưng thực ra chúng không tham chiếu đến một tài nguyên nằm tại địa chỉ đó. Thay vào đó, chúng là một cách chỉ định một định danh duy nhất cho một tập hợp phần tử đã biết. Chuỗi `"http://www.w3.org/1999/XSL/Transform"` là một hằng số chỉ định các phần tử được đánh dấu như vậy thuộc về tập thẻ do W3C chỉ định trong Khuyến nghị XSLT năm 1999. Một chuỗi khác đôi khi xuất hiện trong stylesheet, `"http://www.w3.org/TR/WD-xsl"`, biểu thị sự tuân thủ một bản nháp làm việc trước đó (do đó có WD) của tài liệu W3C. Namespace sau này không tương thích với namespace mà W3C cuối cùng đã chấp nhận và không được Netscape hỗ trợ.

Vì việc gõ lặp đi lặp lại `"http://www.w3.org/1999/XSL/Transform"` sẽ rất tốn công và làm cho markup khó đọc, có một cơ chế chuẩn để gán một tên viết tắt cho namespace trong phần đầu stylesheet. Do đó, một ví dụ đầy đủ về phần tử stylesheet mở đầu có thể trông như sau.

```xml
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
```

pseudo-attribute `xmlns` ánh xạ tên viết tắt `xsl` vào namespace đầy đủ để dùng trong toàn bộ tài liệu phía sau. Vì vậy, phần tử stylesheet ở trên được tiền tố bằng `xsl:`. Mặc dù `xsl` là tên viết tắt thường dùng theo quy ước (gọi là prefix), nó không bắt buộc và hoàn toàn có thể chọn một tên khác. Tất cả ví dụ trong bài viết này đều giả định dùng prefix `xsl`.

## Cách XSLT xử lý cây XML

Bộ máy biến đổi XSLT, gọi là processor, không làm việc trực tiếp trên tài liệu. Trước khi biến đổi có thể diễn ra, tài liệu XML chính và tài liệu stylesheet phải được đưa qua một parser, parser này tạo ra một biểu diễn trừu tượng của cấu trúc tài liệu trong bộ nhớ. Biểu diễn này, gọi là tree, mới là thứ thực sự được processor thao tác. Cây là một kiểu dữ liệu trừu tượng, một mô hình khái niệm có thể được triển khai theo nhiều cách khác nhau tùy parser và processor. Bộ máy của Netscape dùng một cấu trúc tương tự DOM của W3C làm cấu trúc cây, nhưng các cách khác cũng có thể. Các yêu cầu duy nhất liên quan đến cách sắp xếp các đối tượng trong cây, các thuộc tính của chúng và các mối quan hệ giữa chúng.

Cây gồm một khung phân cấp của các node. Nó có thể được tạo từ bảy kiểu node khác nhau: root node duy nhất, element node, text node, attribute node, comment node, processing instruction node, và namespace node.

Ở trên cùng của cây là root node. Root node không tương ứng với bất kỳ phần riêng lẻ nào của tài liệu XML: nó đại diện cho toàn bộ tài liệu. Bên dưới root node là các node con của nó, có thể là phần tử, comment, processing instruction, v.v. Một số node con đó cũng có thể có node con. Và điều này có thể tiếp diễn qua nhiều cấp. Có những ràng buộc nhất định về kiểu node nào có thể xuất hiện ở đâu: ví dụ, text node không thể có node con.

Kết quả của hành động của processor cũng là một cây. Netscape dùng cây này để hiển thị nội dung trong cửa sổ trình duyệt.

## XPath và chọn node

Về bản chất, XSLT stylesheet là một tập hợp các quy tắc, gọi là template, khai báo rằng bất kỳ node nào khớp với mẫu cụ thể này sẽ được xử lý theo cách cụ thể này và kết thúc ở vị trí cụ thể này trong result tree. Chi tiết về cách điều này được thực hiện được để cho processor quyết định. Vì thứ tự thực thi của stylesheet không thể được đảm bảo, XSLT không hỗ trợ bất kỳ chức năng nào tạo ra side-effect. Ở điểm này nó giống Lisp hoặc Scheme.

Việc biến đổi phụ thuộc vào khả năng của processor trong việc xác định chính xác từng node trên cây. Để thuận tiện cho điều này, W3C quyết định dùng một ngôn ngữ riêng, XPath, vốn cũng có công dụng bên ngoài ngữ cảnh XSLT. Đúng như tên gọi của nó, XPath định nghĩa một "đường dẫn" mà processor phải đi qua cây để đến node mong muốn. Đường dẫn này gồm các biểu thức đặc thù XPath cần được đánh giá, các biểu thức có thể bao gồm một số điều kiện cần khớp, một cách liên kết các node, và/hoặc một chỉ báo về hướng trong cây. Phần mô tả đầy đủ hơn về các phần của XPath thường dùng nhất trong XSLT sẽ có ở phần tham khảo.

Các xung đột tiềm năng trong việc khớp template được giải quyết bằng một bộ quy tắc ưu tiên dạng cascading. Nói chung, một quy tắc template cụ thể hơn sẽ được ưu tiên hơn một quy tắc ít cụ thể hơn và, nếu các yếu tố khác bằng nhau, một quy tắc template xuất hiện sau trong tài liệu sẽ được ưu tiên hơn quy tắc xuất hiện trước đó.

Stylesheet có thể được đính kèm vào một tài liệu XML thông qua processing instruction. Để chỉ định stylesheet XSLT nào nên được dùng để xử lý một tài liệu XML cụ thể, hãy chèn một processing instruction vào chính tài liệu XML. Ví dụ, nếu stylesheet có tên inventory.xsl và nằm trong cùng thư mục với tài liệu XML, processing instruction trong tài liệu XML sẽ trông như sau:

```xml
<?xml-stylesheet type="text/xml" href="inventory.xsl"?>
```

Điều này phải được đặt trong phần prolog của tài liệu XML.

## Ví dụ cơ bản

Ví dụ đầu tiên này minh họa những điều cơ bản của việc thiết lập một phép biến đổi XSLT trong trình duyệt.
Ví dụ sử dụng một tài liệu XML chứa thông tin về một bài viết (tiêu đề, danh sách tác giả và phần nội dung) và trình bày nó dưới dạng dễ đọc với con người.

Tài liệu XML (**example.xml**) được hiển thị bên dưới.

```xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="example.xsl"?>
<Article>
  <Title>My Article</Title>
  <Authors>
    <Author>Mr. Foo</Author>
    <Author>Mr. Bar</Author>
  </Authors>
  <Body>This is my article text.</Body>
</Article>
```

Processing instruction `?xml-stylesheet` trong tệp XML chỉ định stylesheet XSLT cần áp dụng trong thuộc tính `href` của nó.

Tệp XSL stylesheet này (**example.xsl**) được hiển thị bên dưới:

```xml
<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text"/>

  <xsl:template match="/">
    Article - <xsl:value-of select="/Article/Title"/>
    Authors: <xsl:apply-templates select="/Article/Authors/Author"/>
  </xsl:template>

  <xsl:template match="Author">
    - <xsl:value-of select="." />
  </xsl:template>

</xsl:stylesheet>
```

Một XSLT stylesheet bắt đầu bằng phần tử `xsl:stylesheet`, phần tử này chứa tất cả _templates_ dùng để tạo đầu ra cuối cùng.
Ví dụ trên có hai template - một template khớp root node và một template khớp các node `Author`.
Template khớp root node sẽ xuất tiêu đề bài viết rồi yêu cầu xử lý tất cả template (thông qua `apply-templates`) khớp các node `Author` là con của node `Authors`.

Để thử ví dụ:

1. Tạo một thư mục trong hệ thống tệp của bạn và bên trong đó tạo các tệp `example.xml` và `example.xsl` được liệt kê ở trên
2. [Khởi động một máy chủ cục bộ](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server#running_a_simple_local_http_server) trong thư mục chứa các tệp.
   Điều này cho phép bạn duyệt các tệp trong thư mục như thể chúng được lưu trữ trên internet.

   > [!WARNING]
   > Mở trực tiếp tệp XML từ hệ thống tệp sẽ không hoạt động, vì việc tải stylesheet từ hệ thống tệp là một [cross-origin request](/en-US/docs/Web/HTTP/Guides/CORS), và sẽ bị chặn theo mặc định.
   > Việc lưu trữ XML và stylesheet trên cùng một máy chủ cục bộ bảo đảm rằng chúng có cùng origin.

3. Mở **example.xml** từ trình duyệt.
4. Kết quả hiển thị của trình duyệt sẽ như sau:

   ```plain
   Browser Output :

       Article - My Article
       Authors:
       - Mr. Foo
       - Mr. Bar
   ```

## Tạo HTML

Một ứng dụng phổ biến của XSLT trong trình duyệt là biến đổi XML thành HTML ở phía client. Ví dụ này sẽ biến tài liệu đầu vào (example2.xml), chứa thông tin về một bài viết, thành một tài liệu HTML.

Phần tử `<body>` của bài viết hiện chứa các phần tử HTML (một thẻ `<b>` và `<u>`). Tài liệu XML chứa cả phần tử HTML lẫn phần tử XML, nhưng chỉ cần một namespace, cụ thể là cho các phần tử XML. Vì không có namespace HTML, và việc dùng XHTML namespace sẽ buộc XSL tạo ra một tài liệu XML không hoạt động như một tài liệu HTML, `xsl:output` trong XSL Stylesheet sẽ đảm bảo tài liệu kết quả được xử lý như HTML. Đối với các phần tử XML, cần namespace riêng của chúng ta, `http://devedge.netscape.com/2002/de`, và nó được gán prefix myNS `(xmlns:myNS="http://devedge.netscape.com/2002/de")`.

### Tệp XML

```xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="example2.xsl"?>
  <myNS:Article xmlns:myNS="http://devedge.netscape.com/2002/de">
    <myNS:Title>My Article</myNS:Title>
    <myNS:Authors>
      <myNS:Author company="Foopy Corp.">Mr. Foo</myNS:Author>
      <myNS:Author>Mr. Bar</myNS:Author>
    </myNS:Authors>
    <myNS:Body>
      The <b>rain</b> in <u>Spain</u> stays mainly in the plains.
    </myNS:Body>
  </myNS:Article>
```

XSL Stylesheet được dùng sẽ cần có hai namespace - một cho các phần tử XSLT và một cho các phần tử XML riêng của chúng ta được dùng trong tài liệu XML. Đầu ra của XSL Stylesheet được đặt thành `HTML` bằng cách dùng phần tử `xsl:output`. Bằng cách đặt đầu ra là HTML và không có namespace trên các phần tử kết quả (được tô màu xanh), các phần tử đó sẽ được xử lý như các phần tử HTML.

### XSL stylesheet với 2 namespace

```xml
<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:myNS="http://devedge.netscape.com/2002/de">

  <xsl:output method="html"/>
  …
</xsl:stylesheet version="1.0">
```

Một template khớp root node của tài liệu XML được tạo ra và dùng để tạo cấu trúc cơ bản của trang HTML.

### Tạo tài liệu HTML cơ bản

```xml
…
<xsl:template match="/">
<html>

  <head>

    <title>
      <xsl:value-of select="/myNS:Article/myNS:Title"/>
    </title>

    <style>
      .myBox {margin:10px 155px 0 50px; border: 1px dotted #639ACE; padding:0 5px 0 5px;}
    </style>

  </head>

  <body>
    <p class="myBox">
      <span class="title">
        <xsl:value-of select="/myNS:Article/myNS:Title"/>
      </span> </br>

      Authors:   <br />
        <xsl:apply-templates select="/myNS:Article/myNS:Authors/myNS:Author"/>
    </p>

    <p class="myBox">
      <xsl:apply-templates select="//myNS:Body"/>
    </p>

  </body>

</html>
</xsl:template>
…
```

Ba `xsl:template` nữa là cần để hoàn thành ví dụ. `xsl:template` đầu tiên dùng cho các node tác giả, còn cái thứ hai xử lý node nội dung. Template thứ ba có một quy tắc khớp chung, sẽ khớp với bất kỳ node và bất kỳ thuộc tính nào. Nó cần thiết để giữ lại các phần tử HTML trong tài liệu XML, vì nó khớp tất cả chúng và sao chép chúng vào tài liệu HTML mà phép biến đổi tạo ra.

### 3 template cuối cùng

```xml
…
<xsl:template match="myNS:Author">
    --   <xsl:value-of select="." />

  <xsl:if test="@company">
    ::   <b>  <xsl:value-of select="@company" />  </b>
  </xsl:if>

  <br />
</xsl:template>
```

```xml
<xsl:template match="myNS:Body">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>
…
```

XSLT stylesheet cuối cùng có dạng như sau:

### XSLT stylesheet cuối cùng

```xml
<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:myNS="http://devedge.netscape.com/2002/de">

  <xsl:output method="html" />

  <xsl:template match="/">
    <html>

      <head>

        <title>
          <xsl:value-of select="/myNS:Article/myNS:Title"/>

        </title>

        <style>
          .myBox {margin:10px 155px 0 50px; border: 1px dotted #639ACE; padding:0 5px 0 5px;}
        </style>

      </head>

      <body>
        <p class="myBox">
          <span class="title">
            <xsl:value-of select="/myNS:Article/myNS:Title"/>
          </span> <br />

          Authors:   <br />
            <xsl:apply-templates select="/myNS:Article/myNS:Authors/myNS:Author"/>
          </p>

        <p class="myBox">
          <xsl:apply-templates select="//myNS:Body"/>
        </p>

      </body>

    </html>
  </xsl:template>

  <xsl:template match="myNS:Author">
      --   <xsl:value-of select="." />

    <xsl:if test="@company">
      ::   <b>  <xsl:value-of select="@company" />  </b>
    </xsl:if>

    <br />
  </xsl:template>

  <xsl:template match="myNS:Body">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@*|node()">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
```

## Tham khảo XSLT/XPath

- [Elements](/en-US/docs/Web/XML/XSLT/Reference/Element)
- [Axes](/en-US/docs/Web/XML/XPath/Reference/Axes)
- [Functions](/en-US/docs/Web/XML/XPath/Reference/Functions)

## Đọc thêm

### Sách

- **XSLT: Programmer's Reference, Second Edition**
  - **Tác giả**: Michael H. Kay
  - **Độ dài**: 992 trang
  - **Nhà xuất bản**: Wrox; ấn bản 2 (3 tháng 5, 2001)
  - **ISBN**: 0764543814
    - Michael Kay là thành viên của W3C XSL Working Group và là tác giả của bộ xử lý XSLT mã nguồn mở của riêng ông, Saxon. Ông cũng là tác giả của cuốn sách duy nhất về chủ đề này đã đạt đến ấn bản thứ hai. Đây là một cuốn sách rất dày, được trình bày tốt và bao quát, dù đôi khi cũng khá nặng nề, với mức độ chi tiết phủ khắp mọi khía cạnh trong câu chuyện XSLT.

<https://www.amazon.com/XSLT-Programmers-Reference-Programmer/dp/0764543814>

- **XSLT**
  - **Tác giả**: Doug Tidwell
  - **Độ dài**: 473 trang
  - **Nhà xuất bản**: O'Reilly Media; ấn bản 1 (15 tháng 8, 2001)
  - **ISBN**: 0596000537
    - Doug Tidwell là một nhà phát triển cao cấp tại IBM và là một người truyền bá nổi bật về công nghệ XML nói chung. Ông là tác giả của nhiều bài viết và hướng dẫn về các khía cạnh khác nhau của XML trên trang nhà phát triển XML rộng lớn của IBM. Cuốn sách này kém toàn diện hơn một chút so với cuốn của Michael Kay, nhưng trình bày rất tốt các phần nền tảng và đưa ra nhiều ví dụ thú vị.

<https://www.amazon.com/Xslt-Doug-Tidwell/dp/0596000537>

- **Learning XML, Second Edition**
  - **Tác giả**: Erik T. Ray
  - **Độ dài**: 432 trang
  - **Nhà xuất bản**: O'Reilly Media; ấn bản 2 (22 tháng 9, 2003)
  - **ISBN**: 0596004206
    - Như tiêu đề cho thấy, đây là một tổng quan chung về XML. Chương 6 dành riêng cho XSLT.

<https://www.amazon.com/gp/product/0596004206>

### Thông số kỹ thuật

- **Trang XSL chính**: <https://www.w3.org/Style/XSL/>
- **Tổng quan về đặc tả XSLT**: <https://www.w3.org/TR/xslt/>
- **Kho lưu trữ các cuộc thảo luận công khai về style (CSS và XSLT)**: [https://lists.w3.org/Archives/Public/www-style/](https://lists.w3.org/Archives/Public/www-style/)
- **Tổng quan về đặc tả XPath**: <https://www.w3.org/TR/xpath/>

### Bài viết

- [XSL Transformations](https://www.ibiblio.org/xml/books/bible3/chapters/ch15.html) của Elliotte Rusty Harold
- [What is XSLT?](https://www.xml.com/pub/a/2000/08/holman/index.html) của G. Ken Holman

### Hướng dẫn/Ví dụ

- [Jeni's XSLT Pages](https://www.jenitennison.com/xslt/)
- [XMLPitstop.com](https://web.archive.org/web/20211209064736/https://www.xmlpitstop.com/default_datatype_SSC.html)
- [XPath Tutorial](https://zvon.org/xxl/XPathTutorial/General/examples.html) của Miloslav Nic, Jiri Jirat
- [XSL Tutorial](https://nwalsh.com/docs/tutorials/xsl/) của Paul Grosso, Norman Walsh
- [XSLT Tutorial](https://zvon.org/xxl/XSLTutorial/Books/Book1/index.html) của Miloslav Nic
