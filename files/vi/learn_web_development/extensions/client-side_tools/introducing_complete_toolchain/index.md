---
title: Giới thiệu chuỗi công cụ hoàn chỉnh
short-title: Chuỗi công cụ mẫu
slug: Learn_web_development/Extensions/Client-side_tools/Introducing_complete_toolchain
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Client-side_tools/Package_management","Learn_web_development/Extensions/Client-side_tools/Deployment", "Learn_web_development/Extensions/Client-side_tools")}}

Trong một vài bài viết cuối của loạt bài, chúng ta sẽ củng cố kiến thức về công cụ của bạn bằng cách hướng dẫn bạn qua quá trình xây dựng chuỗi công cụ nghiên cứu trường hợp mẫu. Chúng ta sẽ đi từ việc thiết lập môi trường phát triển hợp lý và đưa các công cụ chuyển đổi vào chỗ đến thực sự triển khai ứng dụng của bạn. Trong bài viết này, chúng ta sẽ giới thiệu nghiên cứu trường hợp, thiết lập môi trường phát triển, và thiết lập các công cụ chuyển đổi mã.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Củng cố những gì chúng ta đã học cho đến nay bằng cách làm việc qua một
        nghiên cứu trường hợp chuỗi công cụ hoàn chỉnh.
      </td>
    </tr>
  </tbody>
</table>

Thực sự có vô số tổ hợp công cụ và cách sử dụng chúng, những gì bạn thấy trong bài viết này và bài tiếp theo chỉ là _một_ cách mà các công cụ được giới thiệu có thể được sử dụng cho một dự án.

> [!NOTE]
> Điều cũng đáng nhắc lại là không phải tất cả các công cụ này cần chạy trên dòng lệnh. Nhiều trình soạn thảo mã ngày nay (như VS Code) có hỗ trợ tích hợp cho _rất nhiều_ công cụ qua plugin.

## Giới thiệu nghiên cứu trường hợp

Chuỗi công cụ mà chúng ta đang tạo trong bài viết này sẽ được sử dụng để xây dựng và triển khai một trang web mini hiển thị dữ liệu về kho [mdn/content](https://github.com/mdn/content), lấy dữ liệu từ [GitHub API](https://docs.github.com/en/rest/metrics/community).

## Công cụ được sử dụng trong chuỗi công cụ

Trong bài viết này, chúng ta sẽ sử dụng các công cụ và tính năng sau:

- [JSX](https://react.dev/learn/writing-markup-with-jsx), một tập hợp phần mở rộng cú pháp liên quan đến [React](https://react.dev/) cho phép bạn thực hiện những việc như định nghĩa cấu trúc thành phần bên trong JavaScript.
- Các tính năng JavaScript tích hợp mới nhất (tại thời điểm viết bài), chẳng hạn như [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import).
- Các công cụ phát triển hữu ích như [Prettier](https://prettier.io/) để định dạng và [ESLint](https://eslint.org/) để kiểm tra mã.
- [PostCSS](https://postcss.org/) để cung cấp khả năng lồng CSS.
- [Vite](https://vite.dev/) để xây dựng và thu nhỏ mã, và để viết một loạt nội dung tệp cấu hình tự động cho chúng ta.
- [GitHub](/en-US/docs/Learn_web_development/Core/Version_control) để quản lý kiểm soát mã nguồn cũng như cuối cùng để triển khai trang web (sử dụng GitHub Pages).

## Chuỗi công cụ và sự phức tạp vốn có của chúng

Như với bất kỳ chuỗi nào, càng có nhiều liên kết trong chuỗi công cụ của bạn, nó càng phức tạp và tiềm ẩn rủi ro — ví dụ nó có thể phức tạp hơn để cấu hình, và dễ bị hỏng hơn. Ngược lại, càng ít liên kết, chuỗi công cụ có khả năng kiên cường hơn.

Tất cả các dự án web sẽ khác nhau, và bạn cần xem xét những phần nào trong chuỗi công cụ của bạn là cần thiết và xem xét từng phần cẩn thận.

Chuỗi công cụ nhỏ nhất là không có liên kết nào. Bạn sẽ viết tay HTML, sử dụng "vanilla JavaScript" (nghĩa là không có khung hay ngôn ngữ trung gian), và tải thủ công tất cả lên máy chủ để lưu trữ.

Tuy nhiên, các yêu cầu phần mềm phức tạp hơn có thể sẽ được hưởng lợi từ việc sử dụng các công cụ để giúp đơn giản hóa quá trình phát triển.

## Kiểm tra điều kiện tiên quyết

Bạn nên có hầu hết các phần mềm đã nếu bạn đã theo dõi các chương trước. Đây là những gì bạn nên có trước khi tiến hành các bước thiết lập thực sự:

### Tạo tài khoản GitHub

Ngoài các công cụ chúng ta sẽ cài đặt góp phần vào chuỗi công cụ, bạn sẽ cần tạo tài khoản với GitHub nếu bạn muốn hoàn thành hướng dẫn. Trong chương tiếp theo, chúng ta sẽ đẩy vào kho mã GitHub, điều này sẽ gây ra hiệu ứng cascade mà (nên) triển khai tất cả phần mềm lên web.

Đăng ký cho [GitHub](https://github.com/) bằng cách nhấp vào liên kết _Sign Up_ trên trang chủ nếu bạn chưa có tài khoản.

### Cài đặt git

Chúng ta sẽ cài đặt thêm phần mềm, git, để giúp kiểm soát phiên bản.

[Git](https://git-scm.com/) hiện là công cụ kiểm soát phiên bản mã nguồn phổ biến nhất hiện có cho các nhà phát triển. Git có thể [tải xuống và cài đặt qua trang web git-scm](https://git-scm.com/downloads/).

### Dự án hiện có

Chúng ta sẽ xây dựng trên dự án mà chúng ta đã bắt đầu trong chương trước, vì vậy hãy đảm bảo bạn làm theo hướng dẫn trong [Quản lý gói](/en-US/docs/Learn_web_development/Extensions/Client-side_tools/Package_management) để thiết lập dự án đầu tiên.

## Tạo môi trường phát triển

Phần chuỗi công cụ này đôi khi bị xem là trì hoãn công việc thực sự, và có thể rất dễ rơi vào "hố thỏ" của công cụ nơi bạn dành nhiều thời gian để cố gắng làm cho môi trường "đúng".

Nhưng bạn có thể nhìn vào điều này theo cách tương tự như thiết lập môi trường làm việc vật lý của bạn. Ghế cần phải thoải mái, và thiết lập ở vị trí tốt để giúp tư thế của bạn. Bạn cần điện, Wi-Fi và cổng USB!

Chuỗi công cụ sẽ được cấu trúc thành các giai đoạn sau:

- **Môi trường phát triển**: Các công cụ cơ bản nhất để chạy mã của bạn.
- **Lưới an toàn**: Làm cho trải nghiệm phát triển phần mềm ổn định và hiệu quả hơn.
- **Chuyển đổi**: Công cụ cho phép chúng ta sử dụng các tính năng mới nhất của ngôn ngữ trong quá trình phát triển, và sau đó chuyển đổi mã để phiên bản sản xuất vẫn chạy trên nhiều trình duyệt.
- **Sau phát triển**: Công cụ xuất hiện sau khi bạn hoàn thành phần chính của quá trình phát triển để đảm bảo phần mềm của bạn đến được web.

### Công cụ cài đặt thư viện

Bạn đã làm điều này, nhưng để dễ tham khảo, đây là các lệnh để khởi tạo gói npm và cài đặt các phụ thuộc cần thiết:

```bash
npm init
npm install --save-dev vite
npm install plotly.js-dist-min
```

### Kiểm soát phiên bản mã

Hãy thiết lập git và GitHub:

```bash
git init
git add .
git commit -m "Initial commit"
```

### Công cụ gọn mã

Prettier để định dạng và ESLint để kiểm tra mã:

```bash
npm install --save-dev prettier eslint
```

### Thiết lập PostCSS và Vite

PostCSS và Vite đã được cài đặt. Tất cả những gì chúng ta cần là cấu hình phù hợp.

## Viết mã nguồn

Bây giờ chúng ta đã thiết lập đầy đủ chuỗi công cụ phát triển, thường đến lúc bắt đầu viết mã thực sự. Để lấy các tệp mã, hãy truy cập <https://github.com/mdn/client-toolchain-example> và tải xuống và giải nén nội dung của kho này lên ổ cứng cục bộ của bạn.

Bây giờ sao chép nội dung của thư mục `src` của dự án và sử dụng nó để thay thế thư mục `src` hiện tại của bạn.

Cũng cài đặt một vài phụ thuộc mà mã nguồn sử dụng:

```bash
npm install react react-dom @tanstack/react-query
```

## Chạy chuyển đổi

Để bắt đầu làm việc với dự án, chúng ta sẽ chạy máy chủ Vite trên dòng lệnh:

```bash
npm run dev
```

Máy chủ bây giờ đang chạy trên URL được in ra. Hãy vào URL này trong trình duyệt và bạn sẽ thấy ứng dụng mẫu đang chạy!

## Tóm tắt

Chúng ta đã đi một chặng đường dài trong chương này, xây dựng một môi trường phát triển cục bộ khá tốt để tạo ứng dụng.

Tại thời điểm này trong phát triển phần mềm web, bạn thường sẽ tạo mã cho phần mềm bạn có ý định xây dựng. Vì mô-đun này hoàn toàn về việc học các công cụ xung quanh phát triển web, không phải mã phát triển web chính nó, chúng ta sẽ không dạy bạn bất kỳ lập trình thực sự nào.

Thay vào đó, chúng ta đã viết một dự án mẫu để bạn sử dụng công cụ của mình. Chúng ta đề xuất bạn làm qua phần còn lại của chương bằng cách sử dụng mã mẫu, sau đó bạn có thể thử thay đổi nội dung của thư mục src thành dự án của riêng bạn và xuất bản trên GitHub Pages thay thế!

{{PreviousMenuNext("Learn_web_development/Extensions/Client-side_tools/Package_management","Learn_web_development/Extensions/Client-side_tools/Deployment", "Learn_web_development/Extensions/Client-side_tools")}}
