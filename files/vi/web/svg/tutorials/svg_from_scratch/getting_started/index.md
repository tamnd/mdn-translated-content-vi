---
title: Bắt đầu
slug: Web/SVG/Tutorials/SVG_from_scratch/Getting_started
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Introduction", "Web/SVG/Tutorials/SVG_from_scratch/Positions") }}

## Một ví dụ cơ bản

Hãy đi thẳng vào một ví dụ. Xem đoạn mã sau.

```xml
<svg version="1.1"
     width="300" height="200"
     xmlns="http://www.w3.org/2000/svg">

  <rect width="100%" height="100%" fill="red" />

  <circle cx="150" cy="100" r="80" fill="green" />

  <text x="150" y="125" font-size="60" text-anchor="middle" fill="white">SVG</text>

  </svg>
```

Sao chép mã và dán vào một tệp, demo1.svg. Sau đó mở tệp trong trình duyệt. Nó sẽ hiển thị như hình chụp sau đây. (Hoặc [xem trực tiếp](https://mdn.dev/archives/media/attachments/2012/07/09/3075/89b1e0a26e8421e19f907e0522b188bd/svgdemo1.xml))

![Nền đỏ với một vòng tròn xanh lá ở giữa. Văn bản trắng ở giữa vòng tròn là SVG.](svgdemo1.png)

Quá trình hiển thị gồm các bước sau:

1. Chúng ta bắt đầu với phần tử gốc {{SVGElement("svg")}}:
   - Khai báo doctype như trong (X)HTML nên bỏ đi vì việc xác thực SVG dựa trên DTD gây ra nhiều vấn đề hơn là giải quyết được.
   - Trước SVG 2, để xác định phiên bản SVG cho các kiểu xác thực khác, các thuộc tính `version` và `baseProfile` nên luôn được dùng. Cả hai thuộc tính `version` và `baseProfile` đều bị loại bỏ trong SVG 2.
   - Là một phương ngữ XML, SVG luôn phải gắn namespace đúng cách (trong thuộc tính xmlns). Xem trang [Namespaces Crash Course](/en-US/docs/Web/SVG/Guides/Namespaces_crash_course) để biết thêm thông tin.

2. Nền được đặt thành đỏ bằng cách vẽ một hình chữ nhật {{SVGElement("rect")}} bao phủ toàn bộ vùng ảnh.
3. Một hình tròn xanh lá {{SVGElement("circle")}} có bán kính 80px được vẽ lên trên trung tâm của hình chữ nhật đỏ (tâm hình tròn lệch 150px sang phải và 100px xuống dưới từ góc trên bên trái).
4. Văn bản "SVG" được vẽ. Phần bên trong của mỗi chữ cái được tô màu trắng. Văn bản được định vị bằng cách đặt một điểm neo ở nơi ta muốn trung điểm: trong trường hợp này, trung điểm nên trùng với tâm của hình tròn xanh lá. Có thể tinh chỉnh thêm kích thước phông và vị trí dọc để bảo đảm kết quả cuối cùng đẹp mắt.

## Các thuộc tính cơ bản của tệp SVG

- Điều đầu tiên quan trọng cần chú ý là thứ tự hiển thị của các phần tử. Quy tắc hợp lệ chung cho tệp SVG là các phần tử _xuất hiện sau_ sẽ được hiển thị _lên trên_ các phần tử trước đó. Phần tử càng ở dưới thì càng hiển thị rõ hơn.
- Tệp SVG trên web có thể được hiển thị trực tiếp trong trình duyệt hoặc nhúng vào tệp HTML theo nhiều cách:
  - Nếu HTML là XHTML và được gửi dưới dạng `application/xhtml+xml`, SVG có thể được nhúng trực tiếp trong nguồn XML.
  - SVG cũng có thể được nhúng trực tiếp trong HTML.
  - Có thể dùng phần tử `img`.
  - Có thể tham chiếu tệp SVG bằng phần tử `object`:

    ```html
    <object data="image.svg" type="image/svg+xml"></object>
    ```

  - Tương tự, có thể dùng phần tử `iframe`:

    ```html
    <iframe src="image.svg"></iframe>
    ```

  - Cuối cùng, SVG có thể được tạo động bằng JavaScript và chèn vào DOM HTML.

- Cách SVG xử lý kích thước và đơn vị sẽ được giải thích [ở trang tiếp theo](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Positions).

## Các kiểu tệp SVG

Tệp SVG có hai dạng. Tệp SVG thông thường là các tệp văn bản chứa markup SVG. Phần mở rộng tên tệp được khuyến nghị cho các tệp này là ".svg" (tất cả đều viết thường).

Do kích thước có thể rất lớn mà tệp SVG có thể đạt tới khi dùng cho một số ứng dụng (ví dụ, ứng dụng địa lý), đặc tả SVG cũng cho phép các tệp SVG được nén gzip. Phần mở rộng tên tệp được khuyến nghị cho các tệp này là ".svgz" (tất cả đều viết thường). Tuy nhiên, việc làm cho tệp SVG nén gzip hoạt động đáng tin cậy trên mọi user agent có hỗ trợ SVG khi được phục vụ từ máy chủ Microsoft IIS là rất rắc rối, và Firefox không thể tải SVG nén gzip từ máy tính cục bộ. Hãy tránh SVG nén gzip trừ khi bạn đang xuất bản lên một máy chủ web mà bạn biết chắc nó sẽ phục vụ đúng cách (xem bên dưới).

## Một lưu ý về máy chủ web cho tệp .svgz

Bây giờ bạn đã biết cách tạo các tệp SVG cơ bản, bước tiếp theo là tải chúng lên một máy chủ web. Tuy nhiên, ở bước này có vài điều cần lưu ý. Đối với tệp SVG thông thường, máy chủ nên gửi các HTTP header:

```http
Content-Type: image/svg+xml
Vary: Accept-Encoding
```

Đối với tệp SVG nén gzip, máy chủ nên gửi các HTTP header:

```http
Content-Type: image/svg+xml
Content-Encoding: gzip
Vary: Accept-Encoding
```

Bạn có thể kiểm tra rằng máy chủ đang gửi đúng HTTP header cho các tệp SVG của mình bằng cách dùng [Network Monitor panel](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html#headers) hoặc một site như [websniffer.com](https://websniffer.com/). Gửi URL của một trong các tệp SVG của bạn và xem các HTTP response header. Nếu bạn thấy máy chủ của mình không gửi các header với giá trị như trên, thì bạn nên liên hệ nhà cung cấp hosting. Nếu bạn gặp khó khăn khi thuyết phục họ cấu hình đúng máy chủ cho SVG, có thể có cách tự làm được. Xem [server configuration page](https://www.w3.org/services/svg-server/) trên w3.org để biết nhiều giải pháp.

Việc cấu hình sai máy chủ là một nguyên nhân rất phổ biến khiến SVG không tải được, nên hãy nhớ kiểm tra máy chủ của mình. Nếu máy chủ không được cấu hình để gửi đúng header với các tệp SVG mà nó phục vụ, thì Firefox nhiều khả năng sẽ hiển thị markup của các tệp đó dưới dạng văn bản hoặc chuỗi mã hóa rác, hoặc thậm chí hỏi người xem chọn một ứng dụng để mở chúng.

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Introduction", "Web/SVG/Tutorials/SVG_from_scratch/Positions") }}
