---
title: Proxy servers and tunneling
slug: Web/HTTP/Guides/Proxy_servers_and_tunneling
page-type: guide
sidebar: http
---

Khi điều hướng qua các mạng khác nhau của Internet, proxy servers và các đường hầm HTTP tạo điều kiện truy cập vào nội dung trên World Wide Web. Một proxy có thể nằm trên máy tính cục bộ của người dùng, hoặc bất kỳ đâu giữa máy tính của người dùng và máy chủ đích trên Internet. Trang này trình bày một số thông tin cơ bản về proxy và giới thiệu một số tùy chọn cấu hình.

Có hai loại proxy: **forward proxy** (hay tunnel, hoặc gateway) và **reverse proxy** (được sử dụng để kiểm soát và bảo vệ quyền truy cập vào máy chủ để cân bằng tải, xác thực, giải mã hoặc lưu vào cache).

## Forward proxy

Một forward proxy, hoặc gateway, hoặc chỉ đơn giản là "proxy" cung cấp dịch vụ proxy cho một client hoặc một nhóm client. Có lẽ có hàng trăm nghìn forward proxy mở trên Internet. Chúng lưu trữ và chuyển tiếp các dịch vụ Internet (như DNS hoặc các trang web) để giảm và kiểm soát băng thông được sử dụng bởi nhóm.

Forward proxy cũng có thể là ẩn danh và cho phép người dùng ẩn địa chỉ IP của họ khi duyệt web hoặc sử dụng các dịch vụ Internet khác. Ví dụ: [Tor](https://www.torproject.org/) định tuyến lưu lượng internet qua nhiều proxy để ẩn danh.

## Reverse proxy

Như tên gọi, reverse proxy làm ngược lại với những gì forward proxy làm: Forward proxy hoạt động thay mặt cho các client (hoặc máy chủ yêu cầu). Forward proxy có thể ẩn danh tính của các client trong khi reverse proxy có thể ẩn danh tính của các máy chủ. Reverse proxy có một số trường hợp sử dụng, một vài trong số đó là:

- Cân bằng tải: phân phối tải cho một số máy chủ web,
- Lưu vào cache nội dung tĩnh: giảm tải máy chủ web bằng cách lưu vào cache nội dung tĩnh như hình ảnh,
- Nén: nén và tối ưu hóa nội dung để tăng tốc độ tải.

## Chuyển tiếp thông tin client qua proxy

Proxy có thể làm cho các yêu cầu xuất hiện như thể chúng xuất phát từ địa chỉ IP của proxy. Điều này có thể hữu ích nếu proxy được sử dụng để cung cấp ẩn danh cho client, nhưng trong các trường hợp khác thông tin từ yêu cầu gốc bị mất. Địa chỉ IP của client gốc thường được sử dụng để gỡ lỗi, thống kê hoặc tạo nội dung phụ thuộc vị trí. Một cách phổ biến để tiết lộ thông tin này là sử dụng các HTTP header sau:

Header được chuẩn hóa:

- {{HTTPHeader("Forwarded")}}
  - : Chứa thông tin từ phía client của proxy servers bị thay đổi hoặc bị mất khi proxy tham gia vào đường dẫn của yêu cầu.

Hoặc các phiên bản chuẩn de-facto:

- {{HTTPHeader("X-Forwarded-For")}} {{non-standard_inline}}
  - : Xác định các địa chỉ IP nguồn gốc của client kết nối với máy chủ web thông qua HTTP proxy hoặc load balancer.
- {{HTTPHeader("X-Forwarded-Host")}} {{non-standard_inline}}
  - : Xác định máy chủ gốc mà client đã sử dụng để kết nối với proxy hoặc load balancer của bạn.
- {{HTTPHeader("X-Forwarded-Proto")}} {{non-standard_inline}}
  - : Xác định giao thức (HTTP hoặc HTTPS) mà client đã sử dụng để kết nối với proxy hoặc load balancer của bạn.

Để cung cấp thông tin về chính proxy (không phải về client kết nối với nó), header `Via` có thể được sử dụng.

- {{HTTPHeader("Via")}}
  - : Được thêm bởi proxy, cả forward proxy và reverse proxy, và có thể xuất hiện trong các header yêu cầu và header phản hồi.

## HTTP tunneling

Tunneling truyền dữ liệu mạng riêng tư và thông tin giao thức qua mạng công cộng bằng cách đóng gói dữ liệu. HTTP tunneling đang sử dụng giao thức cấp cao hơn (HTTP) để vận chuyển giao thức cấp thấp hơn (TCP).

Giao thức HTTP chỉ định một phương thức yêu cầu được gọi là {{HTTPMethod("CONNECT")}}. Nó bắt đầu giao tiếp hai chiều với tài nguyên được yêu cầu và có thể được sử dụng để mở một đường hầm. Đây là cách client đằng sau HTTP proxy có thể truy cập các trang web sử dụng TLS (tức là HTTPS, cổng 443). Tuy nhiên, lưu ý rằng không phải tất cả proxy servers đều hỗ trợ phương thức `CONNECT` hoặc giới hạn nó chỉ ở cổng 443.

Xem thêm [bài viết HTTP tunnel trên Wikipedia](https://en.wikipedia.org/wiki/HTTP_tunnel).

## Proxy Auto-Configuration (PAC)

Tệp [Proxy Auto-Configuration (PAC)](/en-US/docs/Web/HTTP/Guides/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_PAC_file) là hàm [JavaScript](/en-US/docs/Web/JavaScript) xác định liệu các yêu cầu của trình duyệt web (HTTP, HTTPS và FTP) có đi thẳng đến đích hay được chuyển tiếp đến proxy web server. Hàm JavaScript được chứa trong tệp PAC xác định hàm:

Tệp auto-config nên được lưu vào tệp với phần mở rộng tên tệp `.pac`: `proxy.pac`.

Và loại MIME được đặt thành `application/x-ns-proxy-autoconfig`.

Tệp bao gồm hàm được gọi là `FindProxyForURL`. Ví dụ bên dưới sẽ hoạt động trong môi trường nơi máy chủ DNS nội bộ được thiết lập để chỉ có thể phân giải tên máy chủ nội bộ và mục tiêu là chỉ sử dụng proxy cho các máy chủ không thể phân giải được:

```js
function FindProxyForURL(url, host) {
  if (isResolvable(host)) {
    return "DIRECT";
  }
  return "PROXY proxy.example.com:8080";
}
```

## Xem thêm

- [Tệp Proxy Auto-Configuration (PAC)](/en-US/docs/Web/HTTP/Guides/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_PAC_file)
- Phương thức {{HTTPMethod("CONNECT")}}
- {{glossary("Proxy server")}}
