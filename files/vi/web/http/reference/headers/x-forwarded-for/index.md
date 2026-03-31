---
title: X-Forwarded-For header
short-title: X-Forwarded-For
slug: Web/HTTP/Reference/Headers/X-Forwarded-For
page-type: http-header
status:
  - non-standard
sidebar: http
---

Tiêu đề HTTP **`X-Forwarded-For`** (XFF) {{Glossary("request header")}} là tiêu đề de-facto chuẩn để xác định địa chỉ IP nguồn gốc của máy khách kết nối đến máy chủ web thông qua {{Glossary("proxy server")}}.
Phiên bản chuẩn hóa của tiêu đề này là tiêu đề HTTP {{HTTPHeader("Forwarded")}}, mặc dù nó ít được sử dụng hơn nhiều.

> [!WARNING]
> Việc sử dụng không đúng tiêu đề này có thể là rủi ro bảo mật.
> Để biết chi tiết, xem phần [Mối lo ngại bảo mật và quyền riêng tư](#security_and_privacy_concerns).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
X-Forwarded-For: <client>, <proxy>
X-Forwarded-For: <client>, <proxy>, …, <proxyN>
```

Ví dụ, địa chỉ IP máy khách IPV6 trong tiêu đề đầu tiên, địa chỉ IP máy khách IPV4 trong tiêu đề thứ hai, và địa chỉ IP máy khách IPV4 và địa chỉ IP proxy IPV6 trong ví dụ thứ ba:

```http
X-Forwarded-For: 2001:db8:85a3:8d3:1319:8a2e:370:7348
X-Forwarded-For: 203.0.113.195
X-Forwarded-For: 203.0.113.195, 2001:db8:85a3:8d3:1319:8a2e:370:7348
```

## Chỉ thị

- `<client>`
  - : Địa chỉ IP máy khách.
- `<proxy>`
  - : Địa chỉ IP proxy.
    Nếu yêu cầu đi qua nhiều proxy, địa chỉ IP của mỗi proxy tiếp theo được liệt kê.
    Điều này có nghĩa là địa chỉ IP ngoài cùng bên phải là địa chỉ IP của proxy gần đây nhất và địa chỉ IP ngoài cùng bên trái là địa chỉ của máy khách nguồn gốc (giả sử máy khách và proxy hoạt động đúng).

## Mô tả

Khi máy khách kết nối trực tiếp đến máy chủ, địa chỉ IP của máy khách được gửi đến máy chủ và thường được ghi vào nhật ký truy cập máy chủ.
Nếu kết nối máy khách đi qua bất kỳ proxy chuyển tiếp hoặc ngược nào, máy chủ chỉ thấy địa chỉ IP của proxy cuối cùng, thường không hữu ích nhiều.
Điều đó đặc biệt đúng nếu proxy cuối cùng là load balancer là một phần của cùng triển khai với máy chủ.
Để cung cấp địa chỉ IP máy khách hữu ích hơn cho máy chủ, tiêu đề yêu cầu `X-Forwarded-For` được sử dụng.

Để biết hướng dẫn chi tiết về cách sử dụng `X-Forwarded-For`, xem các phần [Phân tích cú pháp](#parsing) và [Chọn địa chỉ IP](#selecting_an_ip_address).

### Mối lo ngại bảo mật và quyền riêng tư

Tiêu đề này hiển thị thông tin nhạy cảm về quyền riêng tư theo thiết kế, chẳng hạn như địa chỉ IP của máy khách.
Do đó, quyền riêng tư của người dùng phải được ghi nhớ khi sử dụng tiêu đề này.

Nếu bạn biết rằng tất cả proxy trong chuỗi yêu cầu đáng tin cậy (tức là bạn kiểm soát chúng) và được cấu hình đúng, các phần của tiêu đề được thêm bởi proxy của bạn có thể được tin cậy.
Nếu bất kỳ proxy nào là ác ý hoặc được cấu hình sai, bất kỳ phần nào của tiêu đề không được thêm bởi proxy đáng tin cậy có thể bị giả mạo hoặc có định dạng hoặc nội dung không mong đợi.
Nếu máy chủ có thể được kết nối trực tiếp từ internet — ngay cả khi nó cũng ở sau proxy ngược đáng tin cậy — **không có phần nào** của danh sách IP `X-Forwarded-For` có thể được coi là đáng tin cậy hoặc an toàn cho các mục đích liên quan đến bảo mật.

Bất kỳ sử dụng liên quan đến bảo mật nào của `X-Forwarded-For` (chẳng hạn như giới hạn tốc độ hoặc kiểm soát truy cập dựa trên IP) _chỉ được_ sử dụng địa chỉ IP được thêm bởi proxy đáng tin cậy.
Sử dụng các giá trị không đáng tin cậy có thể dẫn đến tránh giới hạn tốc độ, bỏ qua kiểm soát truy cập, kiệt sức bộ nhớ, hoặc các hậu quả tiêu cực khác về bảo mật hoặc tính khả dụng.

Các giá trị ngoài cùng bên trái (không đáng tin cậy) chỉ được sử dụng cho các trường hợp không có tác động tiêu cực từ việc sử dụng các giá trị bị giả mạo.

### Phân tích cú pháp

Phân tích cú pháp không đúng tiêu đề `X-Forwarded-For` có thể có tác động bảo mật tiêu cực với các hậu quả như được mô tả trong phần trước.
Vì lý do này, các điểm sau nên được xem xét khi phân tích cú pháp các giá trị tiêu đề.

Có thể có nhiều tiêu đề `X-Forwarded-For` trong một yêu cầu.
Các địa chỉ IP trong các tiêu đề này phải được coi như một danh sách duy nhất, bắt đầu từ địa chỉ IP đầu tiên của tiêu đề đầu tiên và tiếp tục đến địa chỉ IP cuối cùng của tiêu đề cuối cùng.
Có hai cách tạo danh sách duy nhất này:

- Nối các giá trị tiêu đề `X-Forwarded-For` đầy đủ với dấu phẩy và sau đó chia theo dấu phẩy thành danh sách, hoặc
- chia mỗi tiêu đề `X-Forwarded-For` theo dấu phẩy thành danh sách và sau đó nối các danh sách.

Không đủ khi chỉ sử dụng một trong nhiều tiêu đề `X-Forwarded-For`.

Một số proxy ngược sẽ tự động nối nhiều tiêu đề `X-Forwarded-For` thành một, nhưng an toàn hơn khi không giả định rằng đây là trường hợp.

### Chọn địa chỉ IP

Khi chọn địa chỉ, danh sách đầy đủ các IP (từ tất cả tiêu đề `X-Forwarded-For`) phải được sử dụng.

Khi chọn địa chỉ IP `X-Forwarded-For` gần nhất với máy khách (không đáng tin cậy và _không_ cho mục đích liên quan đến bảo mật), IP đầu tiên từ bên trái ngoài cùng _là địa chỉ hợp lệ_ và _không phải private/internal_ nên được chọn.

> [!NOTE]
> Chúng tôi nói "địa chỉ hợp lệ" ở trên vì các giá trị bị giả mạo có thể không phải là địa chỉ IP thực tế.
> Ngoài ra, chúng tôi nói "không internal/private" vì các máy khách có thể đã sử dụng proxy trên mạng nội bộ của họ, có thể đã thêm các địa chỉ từ [không gian IP riêng](https://en.wikipedia.org/wiki/Private_network).

Khi chọn địa chỉ IP máy khách `X-Forwarded-For` đầu tiên _đáng tin cậy_, cần có cấu hình bổ sung.
Có hai phương pháp phổ biến:

- Đếm proxy đáng tin cậy
  - : Số lượng proxy ngược giữa internet và máy chủ được cấu hình.
    Danh sách IP `X-Forwarded-For` được tìm kiếm từ bên phải ngoài cùng bằng số đó trừ một.
    Ví dụ, nếu chỉ có một proxy ngược, proxy đó sẽ thêm địa chỉ IP của máy khách, vì vậy địa chỉ ngoài cùng bên phải nên được sử dụng.
    Nếu có ba proxy ngược, hai địa chỉ IP cuối cùng sẽ là nội bộ.
- Danh sách proxy đáng tin cậy
  - : Các IP hoặc dải IP của các proxy ngược đáng tin cậy được cấu hình.
    Danh sách IP `X-Forwarded-For` được tìm kiếm từ bên phải ngoài cùng, bỏ qua tất cả các địa chỉ nằm trong danh sách proxy đáng tin cậy.
    Địa chỉ đầu tiên không khớp là địa chỉ mục tiêu.

Địa chỉ IP `X-Forwarded-For` đáng tin cậy đầu tiên có thể thuộc về proxy trung gian không đáng tin cậy thay vì máy khách thực tế, nhưng đó là IP duy nhất phù hợp để xác định máy khách cho mục đích bảo mật.

## Ví dụ

### IP máy khách và proxy

Từ tiêu đề yêu cầu `X-Forwarded-For` sau, chúng ta có thể suy ra rằng địa chỉ IP máy khách là `203.0.113.195`, và yêu cầu đã đi qua hai proxy.
Proxy đầu tiên có địa chỉ IPv6 là `2001:db8:85a3:8d3:1319:8a2e:370:7348` và proxy cuối cùng trong chuỗi yêu cầu có địa chỉ IPv4 là `198.51.100.178`:

```http
X-Forwarded-For: 203.0.113.195,2001:db8:85a3:8d3:1319:8a2e:370:7348,198.51.100.178
```

## Đặc tả

Không phải là một phần của bất kỳ đặc tả hiện tại nào. Phiên bản chuẩn hóa của tiêu đề này là {{HTTPHeader("Forwarded")}}.

## Xem thêm

- Tiêu đề {{HTTPHeader("X-Forwarded-Host")}}, {{HTTPHeader("X-Forwarded-Proto")}}
- {{HTTPHeader("Via")}}
- {{HTTPHeader("Forwarded")}}
- [What is X-Forwarded-For and when can you trust it?](https://httptoolkit.com/blog/what-is-x-forwarded-for/) httptoolkit.com (2024)
