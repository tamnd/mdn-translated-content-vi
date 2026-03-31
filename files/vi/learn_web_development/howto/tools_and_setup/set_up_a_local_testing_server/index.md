---
title: How do you set up a local testing server?
slug: Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server
page-type: learn-faq
sidebar: learn-how-to
---

Bài viết này giải thích cách thiết lập một máy chủ kiểm thử cục bộ đơn giản trên máy của bạn và những điều cơ bản về cách sử dụng nó.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Bạn cần biết trước
        <a href="/en-US/docs/Learn_web_development/Howto/Web_mechanics/How_does_the_Internet_work"
          >Internet hoạt động như thế nào</a
        >, và
        <a href="/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_web_server"
          >máy chủ web là gì</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Bạn sẽ học cách thiết lập máy chủ kiểm thử cục bộ.</td>
    </tr>
  </tbody>
</table>

## Tệp cục bộ vs. tệp từ xa

Trong hầu hết khu vực học tập, chúng tôi hướng dẫn bạn mở trực tiếp các ví dụ trong trình duyệt — điều này có thể thực hiện bằng cách nhấp đúp vào tệp HTML, kéo và thả vào cửa sổ trình duyệt, hoặc chọn _File_ > _Open…_ và điều hướng đến tệp HTML. Có nhiều cách để thực hiện điều này.

Nếu địa chỉ web bắt đầu bằng `file://` theo sau là đường dẫn đến tệp trên ổ cứng cục bộ của bạn, thì đang sử dụng tệp cục bộ. Ngược lại, nếu bạn xem một trong các ví dụ của chúng tôi được lưu trữ trên GitHub (hoặc ví dụ trên một máy chủ từ xa khác), địa chỉ web sẽ bắt đầu bằng `http://` hoặc `https://`, để cho thấy tệp đã được nhận qua HTTP.

## Vấn đề với việc kiểm thử tệp cục bộ

Một số ví dụ sẽ không chạy nếu bạn mở chúng như tệp cục bộ. Điều này có thể do nhiều lý do khác nhau, khả năng nhất là:

- **Chúng có yêu cầu bất đồng bộ**. Một số trình duyệt (bao gồm Chrome) sẽ không chạy các yêu cầu bất đồng bộ (xem [Tìm hiểu: Thực hiện yêu cầu mạng với JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Network_requests)) nếu bạn chỉ chạy ví dụ từ tệp cục bộ. Điều này là do các hạn chế bảo mật (để biết thêm về bảo mật web, hãy đọc [Bảo mật trang web](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Website_security)).
- **Chúng có ngôn ngữ phía máy chủ**. Các ngôn ngữ phía máy chủ (như PHP hoặc Python) yêu cầu máy chủ đặc biệt để diễn giải code và cung cấp kết quả.
- **Chúng bao gồm các tệp khác**. Các trình duyệt thường xử lý các yêu cầu tải tài nguyên sử dụng scheme `file://` như các yêu cầu cross-origin.
  Vì vậy nếu bạn tải một tệp cục bộ bao gồm các tệp cục bộ khác, điều này có thể kích hoạt lỗi {{Glossary("CORS")}}.

## Chạy một máy chủ HTTP cục bộ đơn giản

Để khắc phục vấn đề với các yêu cầu bất đồng bộ, chúng ta cần kiểm thử các ví dụ như vậy bằng cách chạy chúng qua một máy chủ web cục bộ.

### Sử dụng extension trong trình soạn thảo code

Nếu bạn chỉ cần HTML, CSS và JavaScript, và không cần ngôn ngữ phía máy chủ, cách dễ nhất có thể là tìm kiếm các extension trong trình soạn thảo code của bạn. Ngoài việc tự động hóa cài đặt và thiết lập cho máy chủ HTTP cục bộ của bạn, chúng còn tích hợp tốt với các trình soạn thảo code của bạn. Việc kiểm thử tệp cục bộ trong máy chủ HTTP có thể chỉ cần một cú nhấp chuột.

Đối với VS Code, hãy thử các extension miễn phí sau:

- [Live Preview](https://marketplace.visualstudio.com/items?itemName=ms-vscode.live-server)
- [Preview on Web Server](https://marketplace.visualstudio.com/items?itemName=yuichinukiyama.vscode-preview-server)

### Sử dụng Node.js

Module [`http-server`](https://www.npmjs.com/package/http-server) của Node.js là cách dễ dàng để lưu trữ tệp HTML trong bất kỳ thư mục nào.

Để sử dụng module:

1. Chạy các lệnh sau để kiểm tra xem Node.js đã được cài đặt chưa:

   ```bash
   node -v
   npm -v
   npx -v
   ```

2. Nếu Node.js chưa được cài đặt, bạn cần cài đặt nó. Làm theo [hướng dẫn tải về](https://nodejs.org/en/download) trong tài liệu Node.js, sau đó chạy lại các lệnh trên để kiểm tra xem cài đặt có thành công không.

3. Giả sử thư mục là `/path/to/project`. Chạy lệnh sau để khởi động máy chủ:

   ```bash
   npx http-server /path/to/project -o -p 9999
   ```

   Lệnh này lưu trữ tất cả các tệp trong thư mục `/path/to/project` trên `localhost:9999`. Tùy chọn `-o` sẽ mở trang `index.html` trong trình duyệt web. Nếu `index.html` không tồn tại, thư mục sẽ được hiển thị thay thế.

### Sử dụng Python

Một cách khác để thực hiện điều này là sử dụng module `http.server` của Python.

> [!NOTE]
> Các phiên bản Python cũ hơn (đến phiên bản 2.7) cung cấp một module tương tự có tên `SimpleHTTPServer`. Python 2 đã hết vòng đời vì vậy chúng tôi khuyên sử dụng Python 3.

Để làm điều này:

1. Chạy lệnh sau để kiểm tra xem Python đã được cài đặt chưa:

   ```bash
   python -V
   # Nếu lệnh trên thất bại, hãy thử:
   python3 -V
   # Hoặc, nếu lệnh "py" có sẵn, hãy thử:
   py -3 -V
   ```

2. Nếu Python chưa được cài đặt, bạn cần cài đặt nó. Làm theo [hướng dẫn tải về](https://www.python.org/downloads/) trong tài liệu Python (chúng tôi cũng có giải thích chi tiết hơn trong [hướng dẫn Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment#installing_python_3)), sau đó chạy lại các lệnh trên để kiểm tra xem cài đặt có thành công không.

3. Nếu Python đã được thiết lập, hãy điều hướng đến thư mục chứa mã nguồn trang web bạn muốn kiểm thử, sử dụng lệnh `cd`.

   ```bash
   # bao gồm tên thư mục để vào đó, ví dụ
   cd Desktop
   # dùng hai dấu chấm để nhảy lên một cấp thư mục nếu cần
   cd ..
   ```

4. Nhập lệnh để khởi động máy chủ trong thư mục đó:

   ```bash
   # Trên Windows, hãy thử "python -m http.server" hoặc "py -3 -m http.server"
   python3 -m http.server
   ```

5. Theo mặc định, điều này sẽ chạy nội dung của thư mục trên một máy chủ web cục bộ, trên cổng 8000. Bạn có thể đến máy chủ này bằng cách truy cập URL `localhost:8000` trong trình duyệt web của bạn. Ở đây bạn sẽ thấy nội dung của thư mục được liệt kê — nhấp vào tệp HTML bạn muốn chạy.

> [!NOTE]
> Nếu bạn đã có thứ gì đó đang chạy trên cổng 8000, bạn có thể chọn cổng khác bằng cách chạy lệnh máy chủ theo sau là số cổng thay thế, ví dụ: `python3 -m http.server 7800`. Sau đó bạn có thể truy cập nội dung tại `localhost:7800`.

## Chạy ngôn ngữ phía máy chủ cục bộ

Cách tiếp cận tốt nhất để làm việc với ngôn ngữ phía máy chủ, như Python, PHP hoặc JavaScript, phụ thuộc vào ngôn ngữ phía máy chủ bạn đang sử dụng, và liệu bạn có đang làm việc với một web framework hay code "độc lập" không.

Nếu bạn đang làm việc với web framework, thường framework sẽ cung cấp máy chủ phát triển riêng của nó.
Ví dụ: các ngôn ngữ/framework sau đây đi kèm với máy chủ phát triển:

- Các web framework Python, như [Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django), [Flask](https://flask.palletsprojects.com/) và [Pyramid](https://trypyramid.com/).
- Các framework Node/JavaScript như [Express Web Framework (Node.js/JavaScript)](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs)
- PHP có [máy chủ phát triển tích hợp sẵn](https://www.php.net/manual/en/features.commandline.webserver.php) riêng:

  ```bash
  cd path/to/your/php/code
  php -S localhost:8000
  ```

Nếu bạn không làm việc trực tiếp với server-side framework hoặc ngôn ngữ lập trình cung cấp máy chủ phát triển, module `http.server` của Python cũng có thể được sử dụng để kiểm thử code phía máy chủ viết bằng các ngôn ngữ như Python, PHP, JavaScript, v.v., bằng cách gọi các script Common Gateway Interface (CGI) phía máy chủ.
Để biết ví dụ về cách sử dụng tính năng này, hãy xem [Thực thi Script từ xa qua Common Gateway Interface (CGI)](https://realpython.com/python-http-server/#execute-a-script-remotely-through-the-common-gateway-interface-cgi) trong _Cách khởi động máy chủ HTTP trong một dòng code Python_ trên realpython.com.
