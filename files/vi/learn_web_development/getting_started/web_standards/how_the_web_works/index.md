---
title: Web hoạt động như thế nào
slug: Learn_web_development/Getting_started/Web_standards/How_the_web_works
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Getting_started/Web_standards/The_Web_standards_model", "Learn_web_development/Getting_started/Web_standards")}}

_Web hoạt động như thế nào_ cung cấp mô tả tổng quan về những gì xảy ra khi bạn dùng trình duyệt web để điều hướng đến một trang web, giải thích những điều diễn ra phía sau hậu trường để đưa mã nguồn liên quan về máy tính của bạn và để trình duyệt tổng hợp thành thứ bạn có thể xem.

Lý thuyết này không bắt buộc phải biết trong ngắn hạn khi viết mã web, nhưng về lâu dài, bạn sẽ thực sự được hưởng lợi khi hiểu những gì đang xảy ra ở phía sau.

> [!NOTE]
> Bài viết này không đề cập đến cách trình duyệt web thực sự kết xuất mã thành các trang web. Điều đó được trình bày trong [Trình duyệt tải trang web như thế nào](/en-US/docs/Learn_web_development/Getting_started/Web_standards/How_browsers_load_websites).

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với hệ điều hành máy tính, trình duyệt web và các công nghệ web.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu học tập:</th>
      <td>
        <ul>
          <li>Máy khách (client) và máy chủ (server) cùng vai trò của chúng trên web.</li>
          <li>DNS và cách hoạt động của nó ở cấp độ tổng quan.</li>
          <li>Mục đích của TCP/IP, HTTP và gói tin (packet).</li>
          <li>Cú pháp HTTP ở mức cơ bản.</li>
          <li>Các mã phản hồi HTTP phổ biến (ví dụ: 200, 301, 403, 404 và 500).</li>
          <li>Các thành phần cơ bản của một URL (giao thức, tên miền, tên miền con, đường dẫn).</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Máy khách và máy chủ

Các máy tính được kết nối với internet được gọi là **máy khách** (clients) và **máy chủ** (servers). Một sơ đồ đơn giản về cách chúng tương tác có thể trông như thế này:

![Hai hình tròn đại diện cho máy khách và máy chủ. Một mũi tên có nhãn "yêu cầu" đi từ máy khách đến máy chủ, và một mũi tên có nhãn "phản hồi" đi từ máy chủ đến máy khách](simple-client-server.png)

- Máy khách là các thiết bị kết nối internet của người dùng web thông thường (ví dụ: máy tính của bạn kết nối Wi-Fi, hoặc điện thoại kết nối mạng di động) và phần mềm truy cập web trên các thiết bị đó (thường là trình duyệt web như Firefox hoặc Chrome).
- Máy chủ là các máy tính lưu trữ trang web, trang web, hoặc ứng dụng. Khi máy khách muốn truy cập một trang web, một bản sao mã nguồn của trang web đó được tải xuống từ máy chủ về máy khách, nơi trình duyệt kết xuất và hiển thị cho người dùng.

Nội dung nhúng sau đây từ Scrimba<sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp thêm thông tin về máy khách và máy chủ, bao gồm câu hỏi kiểm tra và thảo luận.

<mdn-scrim-inline url="https://scrimba.com/frontend-path-c0j/~0lq" scrimtitle="Clients and servers"></scrim-inline>

## Các thành phần khác trong bộ công cụ

Máy khách và máy chủ mà chúng ta đã mô tả ở trên chưa kể hết câu chuyện. Còn nhiều thành phần khác cũng tham gia, và chúng ta sẽ mô tả chúng bên dưới.

Hãy tưởng tượng rằng internet là một con đường. Ở một đầu là máy khách, giống như ngôi nhà của bạn. Ở đầu kia là máy chủ, giống như một cửa hàng mà bạn muốn mua đồ.

![Bức ảnh đen trắng của một người đang băng qua đường tại vạch kẻ đường dành cho người đi bộ](road.jpg)

Để dữ liệu có thể truyền đi và về, chúng ta cần những thứ sau:

- **Kết nối internet của bạn**: Cho phép bạn gửi và nhận dữ liệu qua internet. Về cơ bản nó giống như con đường giữa nhà bạn và cửa hàng.
- **TCP/IP**: **Giao thức kiểm soát truyền tin** (Transmission Control Protocol) và **Giao thức internet** (Internet Protocol) — TCP/IP — là các giao thức (protocol) truyền thông xác định cách dữ liệu di chuyển qua internet. Đây giống như các phương tiện giao thông cho phép bạn đặt hàng, đến cửa hàng và mua hàng. Trong ví dụ của chúng ta, đây giống như một chiếc xe hơi hay xe đạp (hoặc bất cứ phương tiện nào khác bạn dùng để đi trên đường).
- **DNS**: **Hệ thống tên miền** (Domain Name System — DNS) giống như một cuốn sổ địa chỉ dành cho trang web. Khi bạn gõ địa chỉ web vào trình duyệt, trình duyệt tra cứu DNS để tìm địa chỉ IP (IP address) của trang web — địa chỉ thực sự mà máy chủ đang ở — trước khi có thể lấy trang web về (xem [Giải thích DNS](#dns_explained) bên dưới để biết thêm thông tin). Trình duyệt cần tìm ra máy chủ nào đang lưu trữ trang web, để có thể gửi thông điệp HTTP đúng chỗ (xem bên dưới). Đây giống như việc tra địa chỉ của cửa hàng trước khi bạn đến.
- **HTTP**: **Giao thức truyền siêu văn bản** (Hypertext Transfer Protocol — HTTP) là một {{Glossary("Protocol", "giao thức")}} ứng dụng định nghĩa ngôn ngữ để máy khách và máy chủ nói chuyện với nhau. Đây giống như ngôn ngữ bạn dùng để đặt hàng. Xem [Kiến thức cơ bản về HTTP](#http_basics) bên dưới.
- **Tệp tin**: Một trang web được tạo thành từ nhiều tệp tin khác nhau, giống như các mặt hàng bạn mua từ cửa hàng. Các tệp tin này có hai loại chính:
  - **Mã nguồn**: Trang web được xây dựng chủ yếu từ HTML, CSS và JavaScript — các ngôn ngữ lập trình khác nhau mà trang web được viết bằng đó, và trình duyệt diễn giải và tổng hợp thành một trang web hiển thị cho người dùng.
  - **Tài nguyên**: Đây là thuật ngữ chung cho tất cả các mục khác xuất hiện trên trang web — chẳng hạn như hình ảnh, âm nhạc, video, tài liệu Word và PDF — không phải mã nguồn mà trình duyệt diễn giải.

  > [!NOTE]
  > Bạn có thể tìm hiểu cách trình duyệt ghép các tệp tin này thành trang web sau trong khóa học, tại [Trình duyệt tải trang web như thế nào](/en-US/docs/Learn_web_development/Getting_started/Web_standards/How_browsers_load_websites).

## Vậy điều gì xảy ra, chính xác là?

Khi bạn gõ một địa chỉ web (về mặt kỹ thuật là một phần của [URL](#components_of_a_url)) vào thanh địa chỉ trình duyệt, các bước sau sẽ xảy ra:

1. Trình duyệt đi đến máy chủ DNS và tìm địa chỉ thực sự của máy chủ lưu trữ trang web.
2. Trình duyệt gửi một thông điệp yêu cầu HTTP đến máy chủ, yêu cầu máy chủ gửi một bản sao trang web về máy khách. Thông điệp này, và tất cả dữ liệu khác được truyền giữa máy khách và máy chủ, được gửi qua kết nối internet của bạn sử dụng TCP/IP.
3. Nếu máy chủ chấp thuận yêu cầu của máy khách, máy chủ gửi cho máy khách thông điệp "200 OK", nghĩa là "Tất nhiên bạn có thể xem trang web đó! Đây rồi", rồi bắt đầu gửi các tệp tin của trang web đến trình duyệt dưới dạng nhiều khối nhỏ gọi là [gói tin (packets)](#packets_explained).
4. Trình duyệt ghép các khối nhỏ thành một trang web hoàn chỉnh và hiển thị cho bạn.

## Giải thích DNS

Địa chỉ web thực sự ([URL](#components_of_a_url)) không phải là những chuỗi dễ nhớ mà bạn gõ vào thanh địa chỉ để tìm trang web yêu thích của mình. Chúng là những con số đặc biệt trông như thế này: `192.0.2.172`.

Đây được gọi là {{Glossary("IP Address", "địa chỉ IP")}}, và nó đại diện cho một vị trí duy nhất trên web. Tuy nhiên, nó không dễ nhớ chút nào. Đó là lý do tại sao Hệ thống tên miền được phát minh. Hệ thống này sử dụng các máy chủ đặc biệt để khớp địa chỉ web bạn gõ vào trình duyệt (như `mozilla.org`) với địa chỉ IP thực sự của trang web. Các trang web lớn thường được cung cấp trên nhiều máy chủ để tải hiệu quả cho người dùng khác nhau trên toàn thế giới. Do đó, địa chỉ IP có thể thay đổi tùy theo vị trí của bạn.

Bạn có thể dùng công cụ tra cứu DNS để tìm địa chỉ IP của một trang web. Ví dụ, hãy truy cập [công cụ tra cứu DNS NsLookup.io](https://www.nslookup.io/website-to-ip-lookup/), gõ `developer.mozilla.org` và nhấn nút.

## Giải thích gói tin

Ở trên, chúng ta đã dùng thuật ngữ "gói tin" (packets) để mô tả định dạng trong đó dữ liệu được truyền giữa máy khách và máy chủ. Chúng ta muốn nói gì ở đây?

Khi dữ liệu được gửi qua web, nó được gửi thành nhiều khối nhỏ gọi là gói tin. Mỗi gói tin chứa:

- Một **phần tiêu đề** (header), bao gồm các thông tin như địa chỉ IP của máy chủ và máy khách, số thứ tự gói tin, tổng số gói tin trong lần truyền, và thông tin về các giao thức được dùng trong lần truyền đó.
- Một **phần tải trọng** (payload), chứa dữ liệu thực sự được gửi trong gói tin.

Có nhiều lý do tại sao dữ liệu được gửi dưới dạng các gói tin nhỏ, nhưng quan trọng nhất là:

- Chúng đôi khi bị mất hoặc bị hỏng, và khi điều này xảy ra, sẽ nhanh hơn và dễ dàng hơn để máy khách yêu cầu lại những gói tin bị thiếu thay vì yêu cầu lại toàn bộ tệp tin.
- Các gói tin có thể được định tuyến (route) theo các đường dẫn khác nhau, giúp quá trình truyền hiệu quả nhất có thể và giảm thiểu khả năng làm chậm mạng (network) — đặc biệt khi nhiều người dùng đang yêu cầu cùng một tài nguyên đồng thời. Các gói tin có thể đến theo thứ tự không đúng, nhưng máy khách có thể dùng thông tin trong phần tiêu đề gói tin để đảm bảo chúng được ghép lại theo đúng thứ tự.

## Kiến thức cơ bản về HTTP

HTTP sử dụng một ngôn ngữ đơn giản gồm các động từ để thực hiện các hành động như gửi yêu cầu (xem [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)). Phương thức HTTP [`GET`](/en-US/docs/Web/HTTP/Reference/Methods/GET) thường được dùng để thực hiện các yêu cầu HTTP như loại đã mô tả ở trên. Ví dụ, một yêu cầu đến trang chủ MDN có thể trông như thế này:

```http
GET /en-US/ HTTP/2

Host: developer.mozilla.org
```

Phản hồi được gửi từ máy chủ có thể trông giống như thế này:

```http
HTTP/2 200

date: Tue, 11 Feb 2025 11:13:30 GMT
expires: Tue, 11 Feb 2025 11:40:01 GMT
server: Google frontend
last-modified: Tue, 11 Feb 2025 00:49:32 GMT
ETag: "65f26b7f6463e2347f4e5a7a2adcee54"
content-length: 45227
content-type: text/html

<!doctype html> ... (45227 byte HTML của trang web được yêu cầu)
```

Phản hồi đầy đủ phức tạp hơn thế này, nhưng chúng ta đã bỏ bớt phần lớn để ngắn gọn. Các phần chính như sau:

- `HTTP/2 200`
  - : Phiên bản HTTP mà máy chủ đang sử dụng để gửi phản hồi, trong trường hợp này là HTTP/2, theo sau là [mã trạng thái](/en-US/docs/Web/HTTP/Reference/Status) cho biết yêu cầu có thành công không. `200` nghĩa là thành công.
- `date`, `expires`, v.v.
  - : [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers) chứa thông tin bổ sung về phản hồi (lưu ý rằng yêu cầu cũng có thể có tiêu đề), cung cấp thêm thông tin và/hoặc thay đổi hành vi của nó.
- `<!doctype html>`, v.v.
  - : Phần nội dung phản hồi (response body), trong trường hợp này chứa tài liệu HTML của trang chủ MDN.

> [!NOTE]
> Xem [tài liệu tham khảo HTTP](/en-US/docs/Web/HTTP) trên MDN để biết thêm chi tiết về HTTP, nếu bạn tò mò. [Tổng quan về HTTP](/en-US/docs/Web/HTTP/Guides/Overview) là điểm khởi đầu tốt.

### Các mã trạng thái khác

Ở trên, chúng ta đã gặp mã trạng thái `200`, cho biết rằng yêu cầu HTTP đã thành công. Có nhiều mã trạng thái HTTP với ý nghĩa và cách dùng cụ thể, nhưng bạn thường chỉ gặp một vài mã:

- `301`
  - : Tài nguyên được yêu cầu đã được chuyển vĩnh viễn đến một vị trí mới, được cung cấp trong phản hồi. Mã này được dùng để chuyển hướng nội dung khi nó bị di chuyển.
- `400`
  - : Máy chủ không thể xử lý yêu cầu. Điều này thường xảy ra khi yêu cầu không đúng định dạng mà máy chủ hiểu được, hoặc có lỗi trong đó.
- `403`
  - : Máy chủ sẽ không cấp cho máy khách quyền truy cập vào tài nguyên được yêu cầu. Điều này thường xảy ra khi máy chủ biết máy khách là ai, nhưng họ không có quyền truy cập trang được yêu cầu.
- `404`
  - : Máy chủ không thể tìm thấy tài nguyên được yêu cầu. Mã trạng thái này thường được trả về nếu URL sai hoặc nếu nội dung bị xóa mà không thiết lập chuyển hướng.
- `503`
  - : Yêu cầu không thể được xử lý do sự cố với máy chủ. Điều này phổ biến khi máy chủ ngoại tuyến để bảo trì, và được kỳ vọng là tạm thời.

## Các thành phần của một URL

Về mặt kỹ thuật, địa chỉ web bạn gõ vào thanh địa chỉ trình duyệt tạo thành một phần của **Bộ định vị tài nguyên thống nhất** (**URL** — Uniform Resource Locator). URL xác định vị trí của các tài nguyên duy nhất trên internet.

URL là địa chỉ web cộng với giao thức: ví dụ, nếu bạn mở một tab mới trong trình duyệt, gõ `developer.mozilla.org` vào thanh địa chỉ và nhấn <kbd>Enter</kbd>/<kbd>Return</kbd>, bạn sẽ được chuyển hướng đến một URL như sau:

```plain
https://developer.mozilla.org/en-US/
```

Các phần chính của URL là:

- `https`
  - : **Giao thức** được dùng để gửi yêu cầu. Trong trường hợp này, chúng ta đang dùng [HTTPS](/en-US/docs/Glossary/HTTPS), là phiên bản bảo mật của HTTP ngăn người xấu đọc dữ liệu của bạn khi truyền. Trên web hiện đại, hầu hết mọi máy chủ đều dùng HTTPS, vì vậy nếu bạn không chỉ định rõ ràng, trình duyệt sẽ giả định đó là giao thức bạn đang dùng và tự thêm vào cho bạn.
- `developer.mozilla.org`
  - : [**Tên miền**](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_domain_name) của URL, đại diện cho vị trí cấp cao nhất của máy chủ bạn đang kết nối. Trong trường hợp này, địa chỉ web bạn đã gõ bằng với tên miền, nhưng điều này không phải lúc nào cũng đúng — bạn có thể chọn gõ một địa chỉ web phức tạp hơn. Lưu ý rằng phần `developer` là một **tên miền con** (subdomain) (vùng nội dung riêng biệt) của tên miền `mozilla.org` của Mozilla. Có các tên miền con khác trên trang của Mozilla lưu trữ nội dung riêng biệt — xem [support.mozilla.org](https://support.mozilla.org/) và [bugzilla.mozilla.org](https://bugzilla.mozilla.org/), ví dụ như vậy.
- `/en-US/`
  - : **Đường dẫn** đến tài nguyên trên máy chủ mà bạn đang truy cập. MDN lưu trữ tất cả nội dung tiếng Anh Mỹ trong một thư mục có tên `en-US`, và đó là điều URL này đang trỏ đến.

    Nếu trình duyệt của bạn được cấu hình để ưu tiên nội dung tiếng Anh theo mặc định, thì đây là URL bạn sẽ được chuyển hướng đến khi gõ `developer.mozilla.org`. Nếu trình duyệt của bạn được cấu hình để ưu tiên ngôn ngữ khác mà MDN hỗ trợ, chẳng hạn tiếng Pháp, bạn sẽ được chuyển hướng đến URL khác, chẳng hạn `https://developer.mozilla.org/fr/`. Điều này không có sẵn cho mọi trang web theo mặc định; các nhà phát triển MDN đã cấu hình MDN như vậy để mọi người dễ dàng truy cập ngôn ngữ họ thích.

> [!NOTE]
> Còn rất nhiều thành phần khác có thể xuất hiện trong URL. Xem [URL là gì?](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL) để biết thêm chi tiết.

## Xem thêm

- [Internet hoạt động như thế nào](/en-US/docs/Learn_web_development/Howto/Web_mechanics/How_does_the_Internet_work)

## Ghi nhận

Ảnh đường phố: [Street composing](https://www.pinterest.com/pin/400538960580676851/), bởi [Kevin Digga](https://www.pinterest.com/kevindigga/).

{{NextMenu("Learn_web_development/Getting_started/Web_standards/The_web_standards_model", "Learn_web_development/Getting_started/Web_standards")}}
