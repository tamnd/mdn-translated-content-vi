---
title: "Điền nội dung trang: trình duyệt hoạt động như thế nào"
short-title: Trình duyệt hoạt động như thế nào
slug: Web/Performance/Guides/How_browsers_work
page-type: guide
sidebar: performancesidebar
---

Người dùng muốn trải nghiệm web có nội dung tải nhanh và tương tác mượt mà. Vì vậy, nhà phát triển nên cố gắng đạt được hai mục tiêu này.

Để hiểu cách cải thiện hiệu năng và hiệu năng cảm nhận, việc hiểu cách trình duyệt hoạt động sẽ rất hữu ích.

## Tổng quan

Các trang web nhanh mang lại trải nghiệm người dùng tốt hơn. Người dùng muốn và kỳ vọng những trải nghiệm web có nội dung tải nhanh và tương tác mượt mà.

Hai vấn đề lớn trong hiệu năng web là độ trễ và thực tế rằng, phần lớn thời gian, trình duyệt chỉ chạy trên một luồng.

Độ trễ là mối đe dọa lớn nhất đối với khả năng đảm bảo một trang tải nhanh. Mục tiêu của nhà phát triển là làm cho trang tải nhanh nhất có thể - hoặc ít nhất trông như thể tải cực nhanh - để người dùng nhận được thông tin yêu cầu càng sớm càng tốt. Độ trễ mạng là thời gian cần để truyền các byte qua không khí đến máy tính. Hiệu năng web là những gì chúng ta phải làm để trang tải nhanh nhất có thể.

Phần lớn, trình duyệt được xem là chỉ có một luồng. Nghĩa là, chúng thực thi một tác vụ từ đầu đến cuối trước khi bắt đầu tác vụ khác. Để tương tác mượt mà, mục tiêu của nhà phát triển là bảo đảm các tương tác với trang diễn ra hiệu quả, từ cuộn mượt đến phản hồi tốt với cảm ứng. Thời gian render là yếu tố then chốt, đảm bảo luồng chính có thể hoàn tất mọi công việc chúng ta giao cho nó mà vẫn luôn sẵn sàng xử lý tương tác của người dùng. Có thể cải thiện hiệu năng web bằng cách hiểu bản chất đơn luồng của trình duyệt và giảm thiểu trách nhiệm của luồng chính, khi có thể và phù hợp, để đảm bảo việc render mượt mà và phản hồi với tương tác là tức thời.

## Điều hướng

_Điều hướng_ là bước đầu tiên khi tải một trang web. Nó xảy ra bất cứ khi nào người dùng yêu cầu một trang bằng cách nhập URL vào thanh địa chỉ, nhấp vào liên kết, gửi biểu mẫu, cũng như các hành động khác.

Một trong những mục tiêu của hiệu năng web là giảm thiểu thời gian mà điều hướng cần để hoàn tất. Trong điều kiện lý tưởng, điều này thường không mất quá lâu, nhưng độ trễ và băng thông là những kẻ thù có thể gây ra chậm trễ.

### Tra cứu DNS

Bước đầu tiên khi điều hướng đến một trang web là tìm vị trí của các tài nguyên cho trang đó. Nếu bạn điều hướng đến `https://example.com`, trang HTML nằm trên máy chủ có địa chỉ IP `93.184.216.34`. Nếu bạn chưa từng truy cập trang này, một lượt tra cứu DNS phải diễn ra.

Trình duyệt của bạn yêu cầu tra cứu DNS, sau đó yêu cầu này cuối cùng được máy chủ tên xử lý, rồi máy chủ đó phản hồi bằng một địa chỉ IP. Sau yêu cầu ban đầu này, IP rất có thể sẽ được lưu vào bộ nhớ đệm trong một khoảng thời gian, giúp tăng tốc các yêu cầu tiếp theo bằng cách lấy địa chỉ IP từ bộ nhớ đệm thay vì liên hệ lại với máy chủ tên.

Tra cứu DNS thường chỉ cần thực hiện một lần cho mỗi hostname trong một lần tải trang. Tuy nhiên, tra cứu DNS phải được thực hiện cho mỗi hostname duy nhất mà trang được yêu cầu tham chiếu. Nếu phông chữ, hình ảnh, script, quảng cáo và số liệu của bạn đều có các hostname khác nhau, thì mỗi hostname sẽ cần một lượt tra cứu DNS riêng.

![Các yêu cầu trên thiết bị di động trước hết đi tới tháp di động, rồi tới máy tính của công ty điện thoại trung tâm trước khi được gửi lên internet](latency.jpg)

Điều này có thể gây bất lợi cho hiệu năng, đặc biệt trên mạng di động. Khi người dùng ở trên mạng di động, mỗi lượt tra cứu DNS phải đi từ điện thoại tới tháp di động để đến được một máy chủ DNS có thẩm quyền. Khoảng cách giữa điện thoại, tháp di động và máy chủ tên có thể làm tăng đáng kể độ trễ.

### Bắt tay TCP

Khi địa chỉ IP đã được xác định, trình duyệt thiết lập kết nối tới máy chủ thông qua {{glossary('TCP handshake','bắt tay ba bước TCP')}}. Cơ chế này được thiết kế để hai thực thể đang cố gắng giao tiếp - trong trường hợp này là trình duyệt và máy chủ web - có thể thương lượng các tham số của kết nối socket TCP mạng trước khi truyền dữ liệu, thường là qua {{glossary('HTTPS')}}.

Kỹ thuật bắt tay ba bước của TCP thường được gọi là "SYN-SYN-ACK" - hay chính xác hơn là SYN, SYN-ACK, ACK - vì có ba thông điệp được TCP truyền đi để thương lượng và bắt đầu một phiên TCP giữa hai máy tính. Đúng vậy, điều này có nghĩa là thêm ba thông điệp qua lại giữa mỗi máy chủ, và yêu cầu vẫn chưa được thực hiện.

### Thương lượng TLS

Đối với các kết nối an toàn được thiết lập qua HTTPS, cần thêm một "bắt tay" nữa. Bắt tay này, hay đúng hơn là quá trình thương lượng {{glossary('TLS')}}, xác định bộ mật mã sẽ được dùng để mã hóa giao tiếp, xác minh máy chủ, và thiết lập rằng một kết nối an toàn đã sẵn sàng trước khi bắt đầu truyền dữ liệu thực sự. Việc này cần thêm năm lượt khứ hồi nữa tới máy chủ trước khi yêu cầu nội dung thực sự được gửi đi.

![Tra cứu DNS, bắt tay TCP, và 5 bước của bắt tay TLS gồm client hello, server hello và certificate, client key và finished cho cả server lẫn client.](ssl.jpg)

Mặc dù việc làm cho kết nối an toàn sẽ tăng thời gian tải trang, một kết nối an toàn vẫn xứng đáng với chi phí độ trễ, vì dữ liệu được truyền giữa trình duyệt và máy chủ web không thể bị giải mã bởi bên thứ ba.

Sau tám lượt khứ hồi tới máy chủ, trình duyệt cuối cùng cũng có thể thực hiện yêu cầu.

## Phản hồi

Khi đã có kết nối với một máy chủ web, trình duyệt gửi một [yêu cầu HTTP `GET`](/en-US/docs/Web/HTTP/Reference/Methods) ban đầu thay mặt cho người dùng, và với các trang web thì đó thường là một tệp HTML. Khi máy chủ nhận được yêu cầu, nó sẽ trả về các header phản hồi phù hợp cùng với nội dung HTML.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>My simple page</title>
    <link rel="stylesheet" href="styles.css" />
    <script src="myscript.js"></script>
  </head>
  <body>
    <h1 class="heading">My Page</h1>
    <p>A paragraph with a <a href="https://example.com/about">link</a></p>
    <div>
      <img src="my-image.jpg" alt="image description" />
    </div>
    <script src="another-script.js"></script>
  </body>
</html>
```

Phản hồi cho yêu cầu ban đầu này chứa byte dữ liệu đầu tiên nhận được. {{glossary('Time to First Byte')}} (TTFB) là khoảng thời gian giữa lúc người dùng thực hiện yêu cầu - chẳng hạn bằng cách nhấp vào một liên kết - và lúc nhận được gói HTML đầu tiên này. Phần nội dung đầu tiên thường là 14KB dữ liệu.

Trong ví dụ trên, yêu cầu chắc chắn nhỏ hơn 14KB, nhưng các tài nguyên được liên kết sẽ không được yêu cầu cho đến khi trình duyệt gặp các liên kết đó trong quá trình phân tích cú pháp, như mô tả bên dưới.

### Kiểm soát tắc nghẽn / TCP slow start

Các gói TCP được chia thành các đoạn trong quá trình truyền. Vì TCP đảm bảo thứ tự của các gói, máy chủ phải nhận được một xác nhận từ client dưới dạng gói ACK sau khi gửi một số đoạn nhất định.

Nếu máy chủ đợi ACK sau mỗi đoạn, điều đó sẽ dẫn đến ACK xuất hiện thường xuyên từ client và có thể làm tăng thời gian truyền, ngay cả trong trường hợp mạng ít tải.

Mặt khác, gửi quá nhiều đoạn cùng lúc có thể dẫn đến tình huống trên một mạng bận, client không thể nhận các đoạn và chỉ tiếp tục phản hồi bằng các ACK trong một thời gian dài, còn máy chủ sẽ phải tiếp tục gửi lại các đoạn.

Để cân bằng số lượng đoạn được truyền, thuật toán {{glossary('TCP slow start')}} được dùng để tăng dần lượng dữ liệu truyền cho đến khi xác định được băng thông mạng tối đa, và giảm lượng dữ liệu truyền trong trường hợp tải mạng cao.

Số đoạn được truyền được kiểm soát bởi giá trị cửa sổ tắc nghẽn (CWND), giá trị này có thể được khởi tạo là 1, 2, 4 hoặc 10 MSS (MSS là 1500 byte theo giao thức Ethernet). Giá trị đó là số byte cần gửi, và sau khi nhận được chúng, client phải gửi một ACK.

Nếu một ACK được nhận, giá trị CWND sẽ được nhân đôi, và vì vậy máy chủ sẽ có thể gửi nhiều đoạn hơn ở lần tiếp theo. Nếu không nhận được ACK, giá trị CWND sẽ bị giảm một nửa. Cơ chế đó giúp đạt được sự cân bằng giữa việc gửi quá nhiều đoạn và gửi quá ít đoạn.

## Phân tích cú pháp

Khi trình duyệt nhận được phần dữ liệu đầu tiên, nó có thể bắt đầu phân tích thông tin đã nhận. {{glossary('parse', 'Phân tích cú pháp')}} là bước trình duyệt thực hiện để biến dữ liệu nó nhận qua mạng thành {{glossary('DOM')}} và {{glossary('CSSOM')}}, vốn được bộ dựng dùng để vẽ một trang lên màn hình.

DOM là biểu diễn nội bộ của markup đối với trình duyệt. DOM cũng được lộ ra và có thể được thao tác thông qua nhiều API trong JavaScript.

Ngay cả khi HTML của trang được yêu cầu lớn hơn gói 14KB ban đầu, trình duyệt vẫn sẽ bắt đầu phân tích cú pháp và cố gắng render một trải nghiệm dựa trên dữ liệu mà nó có. Đây là lý do tại sao tối ưu hiệu năng web cần bao gồm mọi thứ mà trình duyệt cần để bắt đầu render một trang, hoặc ít nhất là một mẫu của trang - CSS và HTML cần cho lần render đầu tiên - trong 14KB đầu tiên. Nhưng trước khi bất cứ thứ gì được render lên màn hình, HTML, CSS và JavaScript đều phải được phân tích cú pháp.

### Xây dựng cây DOM

Chúng ta mô tả năm bước trong [đường dẫn render quan trọng](/en-US/docs/Web/Performance/Guides/Critical_rendering_path).

Bước đầu tiên là xử lý markup HTML và xây dựng cây DOM. Phân tích HTML bao gồm [tokenization](/en-US/docs/Web/API/DOMTokenList) và xây dựng cây. Các token HTML gồm thẻ mở và thẻ đóng, cũng như tên và giá trị thuộc tính. Nếu tài liệu có cấu trúc đúng, việc phân tích nó sẽ đơn giản và nhanh hơn. Bộ phân tích cú pháp phân tích đầu vào đã được token hóa thành tài liệu, xây dựng cây tài liệu.

Cây DOM mô tả nội dung của tài liệu. Phần tử [`<html>`](/en-US/docs/Web/HTML/Reference/Elements/html) là phần tử đầu tiên và nút gốc của cây tài liệu. Cây phản ánh mối quan hệ và thứ bậc giữa các phần tử khác nhau. Các phần tử lồng bên trong phần tử khác là các nút con. Số lượng nút DOM càng lớn, càng mất nhiều thời gian để xây dựng cây DOM.

![Cây DOM cho đoạn mã mẫu của chúng ta, cho thấy tất cả các nút, bao gồm cả nút văn bản.](dom.gif)

Khi bộ phân tích gặp các tài nguyên không chặn, chẳng hạn như hình ảnh, trình duyệt sẽ yêu cầu các tài nguyên đó và tiếp tục phân tích cú pháp. Việc phân tích có thể tiếp tục khi gặp một tệp CSS, nhưng các phần tử `<script>` - đặc biệt là những phần tử không có thuộc tính [`async`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) hoặc `defer` - sẽ chặn việc render và tạm dừng quá trình phân tích HTML. Dù bộ quét tải trước của trình duyệt có giúp tăng tốc quá trình này, các script quá nhiều vẫn có thể là một nút thắt đáng kể.

### Bộ quét tải trước

Trong khi trình duyệt xây dựng cây DOM, quá trình này chiếm luồng chính. Trong lúc đó, _bộ quét tải trước_ sẽ phân tích phần nội dung có sẵn và yêu cầu các tài nguyên ưu tiên cao như CSS, JavaScript và phông chữ web. Nhờ bộ quét tải trước, chúng ta không phải đợi đến khi bộ phân tích tìm thấy tham chiếu tới một tài nguyên ngoài mới yêu cầu nó. Nó sẽ lấy các tài nguyên ở nền để đến khi bộ phân tích HTML chính chạm tới các tài nguyên được yêu cầu, chúng có thể đã đang trên đường hoặc đã được tải xong. Các tối ưu mà bộ quét tải trước cung cấp giúp giảm sự chặn.

```html
<link rel="stylesheet" href="styles.css" />
<script src="my-script.js" async></script>
<img src="my-image.jpg" alt="image description" />
<script src="another-script.js" async></script>
```

Trong ví dụ này, trong khi luồng chính đang phân tích HTML và CSS, bộ quét tải trước sẽ tìm thấy các script và hình ảnh, rồi cũng bắt đầu tải chúng xuống. Để bảo đảm script không chặn quá trình, hãy thêm thuộc tính `async`, hoặc thuộc tính `defer` nếu thứ tự phân tích và thực thi JavaScript là quan trọng.

Chờ lấy CSS không chặn việc phân tích hay tải HTML, nhưng nó chặn JavaScript vì JavaScript thường được dùng để truy vấn tác động của các thuộc tính CSS lên phần tử.

### Xây dựng cây CSSOM

Bước thứ hai trong đường dẫn render quan trọng là xử lý CSS và xây dựng cây CSSOM. Mô hình đối tượng CSS giống DOM. DOM và CSSOM đều là cây. Chúng là các cấu trúc dữ liệu độc lập. Trình duyệt chuyển các quy tắc CSS thành một bản đồ kiểu mà nó có thể hiểu và làm việc với. Trình duyệt đi qua từng tập quy tắc trong CSS, tạo ra một cây nút với quan hệ cha, con và anh em dựa trên các selector CSS.

Giống như với HTML, trình duyệt cần chuyển các quy tắc CSS đã nhận thành thứ gì đó nó có thể làm việc được. Vì vậy, nó lặp lại quá trình chuyển từ HTML sang đối tượng, nhưng áp dụng cho CSS.

Cây CSSOM bao gồm các kiểu từ bảng kiểu của user agent. Trình duyệt bắt đầu với quy tắc tổng quát nhất áp dụng cho một nút và tinh chỉnh đệ quy các kiểu tính toán bằng cách áp dụng những quy tắc cụ thể hơn. Nói cách khác, nó kế thừa các giá trị thuộc tính theo kiểu xếp tầng.

Xây dựng CSSOM diễn ra rất, rất nhanh, và thông tin về thời gian xây dựng này không được hiển thị trong công cụ dành cho nhà phát triển.
Thay vào đó, mục "Recalculate Style" trong công cụ dành cho nhà phát triển hiển thị tổng thời gian cần để phân tích CSS, xây dựng cây CSSOM, và tính toán đệ quy các kiểu đã tính. Xét về hiệu năng web, có nhiều cách tốt hơn để đầu tư nỗ lực tối ưu, vì tổng thời gian tạo CSSOM thường ngắn hơn thời gian cần cho một lượt tra cứu DNS.

### Các quá trình khác

#### Biên dịch JavaScript

Trong khi CSS đang được phân tích và CSSOM đang được tạo, các tài nguyên khác, bao gồm các tệp JavaScript, đang được tải xuống (nhờ bộ quét tải trước). JavaScript được phân tích, biên dịch và diễn giải. Các script được phân tích thành cây cú pháp trừu tượng. Một số công cụ trình duyệt lấy [cây cú pháp trừu tượng](https://en.wikipedia.org/wiki/Abstract_Syntax_Tree) và chuyển chúng vào một trình biên dịch, tạo ra bytecode. Đây được gọi là biên dịch JavaScript. Phần lớn mã được diễn giải trên luồng chính, nhưng có ngoại lệ như mã chạy trong [web workers](/en-US/docs/Web/API/Web_Workers_API).

#### Xây dựng cây khả năng truy cập

Trình duyệt cũng xây dựng một cây [khả năng truy cập](/en-US/docs/Learn_web_development/Core/Accessibility) mà các thiết bị hỗ trợ dùng để phân tích và diễn giải nội dung. Mô hình đối tượng khả năng truy cập (AOM) giống như một phiên bản ngữ nghĩa của DOM. Trình duyệt cập nhật cây khả năng truy cập khi DOM được cập nhật. Bản thân các công nghệ hỗ trợ không thể chỉnh sửa cây khả năng truy cập.

Cho đến khi AOM được xây dựng, nội dung chưa thể truy cập được đối với [screen reader](/en-US/docs/Web/Accessibility/ARIA/Guides/Screen_Reader_Implementors).

## Kết xuất

Các bước render bao gồm style, layout, paint, và trong một số trường hợp là compositing. Các cây CSSOM và DOM được tạo trong bước phân tích cú pháp được kết hợp thành một render tree, rồi tree này được dùng để tính layout của mọi phần tử nhìn thấy, sau đó được vẽ lên màn hình. Trong một số trường hợp, nội dung có thể được nâng lên thành layer riêng và được compositing, cải thiện hiệu năng bằng cách vẽ các phần của màn hình trên GPU thay vì CPU, giải phóng luồng chính.

### Kiểu

Bước thứ ba trong đường dẫn render quan trọng là kết hợp DOM và CSSOM thành render tree. Việc xây dựng cây style tính toán, hay render tree, bắt đầu từ gốc của cây DOM, duyệt qua từng nút hiển thị.

Những phần tử sẽ không được hiển thị, như phần tử [`<head>`](/en-US/docs/Web/HTML/Reference/Elements/head) và các phần tử con của nó, cùng mọi nút có `display: none`, chẳng hạn như `script { display: none; }` mà bạn sẽ thấy trong các bảng kiểu của user agent, sẽ không được đưa vào render tree vì chúng sẽ không xuất hiện trong đầu ra được render. Các nút có áp dụng `visibility: hidden` vẫn được đưa vào render tree, vì chúng vẫn chiếm không gian. Do chúng ta chưa đặt chỉ thị nào để ghi đè mặc định của user agent, nút `script` trong ví dụ mã ở trên sẽ không được đưa vào render tree.

Mỗi nút hiển thị đều được áp dụng các quy tắc CSSOM của nó. Render tree chứa tất cả các nút hiển thị với nội dung và các kiểu tính toán - ghép tất cả các kiểu liên quan với mọi nút hiển thị trong cây DOM, và xác định, dựa trên [CSS cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction), các kiểu tính toán của từng nút là gì.

### Bố cục

Bước thứ tư trong đường dẫn render quan trọng là chạy layout trên render tree để tính hình học của từng nút. _Layout_ là quá trình xác định kích thước và vị trí của tất cả các nút trong render tree, cùng với việc xác định kích thước và vị trí của từng đối tượng trên trang. _Reflow_ là mọi lần xác định kích thước và vị trí tiếp theo của bất kỳ phần nào của trang hoặc của toàn bộ tài liệu.

Khi render tree đã được xây dựng, layout bắt đầu. Render tree đã xác định những nút nào được hiển thị (ngay cả khi vô hình) cùng với các kiểu tính toán của chúng, nhưng không phải kích thước hay vị trí của từng nút. Để xác định chính xác kích thước và vị trí của từng đối tượng, trình duyệt bắt đầu từ gốc của render tree và duyệt qua nó.

Trên trang web, gần như mọi thứ đều là một hộp. Các thiết bị khác nhau và các thiết lập desktop khác nhau đồng nghĩa với số lượng kích thước viewport khác nhau gần như vô hạn. Ở giai đoạn này, có xét đến kích thước viewport, trình duyệt xác định kích thước của tất cả các hộp khác nhau sẽ là gì trên màn hình. Lấy kích thước viewport làm cơ sở, layout thường bắt đầu với `body`, bố trí kích thước của tất cả các phần tử con của `body`, với các thuộc tính box model của từng phần tử, đồng thời dành không gian giữ chỗ cho các phần tử thay thế mà nó chưa biết kích thước, chẳng hạn như hình ảnh của chúng ta.

Lần đầu tiên kích thước và vị trí của từng nút được xác định được gọi là _layout_. Các lần tính lại _layout_ tiếp theo được gọi là _reflow_. Trong ví dụ của chúng ta, giả sử layout ban đầu diễn ra trước khi hình ảnh được trả về. Vì chúng ta không khai báo kích thước của hình ảnh, sẽ có một lần reflow khi kích thước hình ảnh được biết.

### Tô vẽ

Bước cuối cùng trong đường dẫn render quan trọng là vẽ từng nút lên màn hình, và lần đầu tiên diễn ra được gọi là [first Meaningful Paint](/en-US/docs/Glossary/First_meaningful_paint). Trong giai đoạn paint hoặc rasterization, trình duyệt chuyển mỗi hộp đã tính trong giai đoạn layout thành các pixel thực tế trên màn hình. Painting bao gồm vẽ mọi phần trực quan của một phần tử lên màn hình, bao gồm văn bản, màu sắc, đường viền, bóng đổ, và các phần tử thay thế như nút và hình ảnh. Trình duyệt cần làm việc này cực nhanh.

Để bảo đảm cuộn và hoạt ảnh mượt mà, mọi thứ chiếm luồng chính, bao gồm cả việc tính kiểu, cùng với reflow và paint, phải mất ít hơn 16.67ms để trình duyệt hoàn thành. Ở độ phân giải 2048 x 1536, iPad có hơn 3,145,000 pixel cần được vẽ lên màn hình. Đó là rất nhiều pixel phải được vẽ rất nhanh. Để bảo đảm việc vẽ lại có thể được thực hiện nhanh hơn cả lần vẽ đầu tiên, việc vẽ lên màn hình thường được chia thành nhiều layer. Nếu điều này xảy ra, compositing là cần thiết.

Painting có thể chia các phần tử trong cây layout thành các layer. Nâng nội dung lên các layer trên GPU (thay vì luồng chính trên CPU) cải thiện hiệu năng paint và repaint. Có những thuộc tính và phần tử cụ thể tạo ra một layer, bao gồm [`<video>`](/en-US/docs/Web/HTML/Reference/Elements/video) và [`<canvas>`](/en-US/docs/Web/HTML/Reference/Elements/canvas), cùng bất kỳ phần tử nào có các thuộc tính CSS {{cssxref("opacity")}}, một {{cssxref("transform")}} 3D, {{cssxref("will-change")}}, và một vài thuộc tính khác. Những nút này sẽ được vẽ lên layer riêng của chúng, cùng với các nút con, trừ khi một nút con đòi hỏi layer riêng vì một trong các lý do trên hoặc nhiều hơn.

Các layer thực sự giúp cải thiện hiệu năng nhưng lại tốn kém về quản lý bộ nhớ, vì vậy không nên lạm dụng chúng như một phần của các chiến lược tối ưu hiệu năng web.

### Ghép lớp

Khi các phần của tài liệu được vẽ ở những layer khác nhau và chồng lên nhau, compositing là cần thiết để bảo đảm chúng được vẽ lên màn hình theo đúng thứ tự và nội dung được render chính xác.

Khi trang tiếp tục tải tài nguyên, reflow có thể xảy ra (nhớ lại ví dụ hình ảnh của chúng ta đến muộn). Một reflow sẽ kích hoạt repaint và một lần re-composite. Nếu chúng ta đã định nghĩa kích thước của hình ảnh, sẽ không cần reflow, và chỉ layer nào cần được repaint mới được repaint, rồi compositing nếu cần. Nhưng chúng ta đã không đưa kích thước hình ảnh vào! Khi hình ảnh được lấy từ máy chủ, quá trình render quay lại các bước layout và bắt đầu lại từ đó.

## Tương tác

Khi luồng chính đã xong việc vẽ trang, bạn có thể nghĩ rằng mọi thứ đã "ổn cả". Nhưng điều đó không nhất thiết đúng. Nếu quá trình tải có JavaScript, và JavaScript đó được trì hoãn đúng cách, chỉ thực thi sau khi sự kiện [`onload`](/en-US/docs/Web/API/Window/load_event) kích hoạt, luồng chính có thể đang bận và không sẵn sàng cho cuộn, cảm ứng và các tương tác khác.

{{glossary('Time to Interactive')}} (TTI) là thước đo cho biết đã mất bao lâu từ yêu cầu đầu tiên dẫn đến tra cứu DNS và kết nối TCP cho đến khi trang có thể tương tác - tức là thời điểm sau {{glossary('First Contentful Paint')}} khi trang phản hồi với tương tác của người dùng trong vòng 50ms. Nếu luồng chính đang bận phân tích, biên dịch và thực thi JavaScript, nó sẽ không khả dụng và do đó không thể phản hồi tương tác của người dùng trong thời gian kịp thời (dưới 50ms).

Trong ví dụ của chúng ta, có thể hình ảnh tải rất nhanh, nhưng có lẽ tệp `another-script.js` có dung lượng 2MB và kết nối mạng của người dùng chậm. Trong trường hợp này, người dùng sẽ thấy trang rất nhanh, nhưng không thể cuộn mà không bị giật cho tới khi script được tải xuống, phân tích và thực thi. Đó không phải là trải nghiệm người dùng tốt. Tránh chiếm dụng luồng chính, như minh họa trong ví dụ WebPageTest sau:

![Luồng chính bị chiếm bởi việc tải xuống, phân tích và thực thi một tệp JavaScript - trên một kết nối nhanh](visa_network.png)

Trong ví dụ này, việc thực thi JavaScript mất hơn 1.5 giây, và luồng chính bị chiếm trọn trong toàn bộ khoảng thời gian đó, không phản hồi các sự kiện click hay chạm màn hình.

## Xem thêm

- [Web Performance](/en-US/docs/Web/Performance)
