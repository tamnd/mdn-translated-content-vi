---
title: Xây dựng ứng dụng Angular và tài nguyên thêm
slug: Learn_web_development/Core/Frameworks_libraries/Angular_building
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Core/Frameworks_libraries/Angular_filtering", "Learn_web_development/Core/Frameworks_libraries")}}

Bài viết Angular cuối cùng này đề cập đến cách xây dựng ứng dụng sẵn sàng cho môi trường sản xuất, và cung cấp thêm tài nguyên để bạn tiếp tục hành trình học tập.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>,
        kiến thức về
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
          >terminal/command line</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Tìm hiểu cách xây dựng ứng dụng Angular của bạn.</td>
    </tr>
  </tbody>
</table>

## Xây dựng ứng dụng đã hoàn thiện

Bây giờ bạn đã hoàn thành việc phát triển ứng dụng, bạn có thể chạy lệnh `build` của Angular CLI.
Khi bạn chạy lệnh `build` trong thư mục `todo`, ứng dụng của bạn biên dịch vào thư mục đầu ra có tên `dist/`.

Trong thư mục `todo`, hãy chạy lệnh sau tại dòng lệnh:

```bash
ng build -c production
```

CLI biên dịch ứng dụng và đặt đầu ra vào thư mục `dist` mới.
Cờ `--configuration production`/`-c production` với `ng build` loại bỏ những thứ bạn không cần cho môi trường sản xuất.

## Triển khai ứng dụng của bạn

Để triển khai ứng dụng, bạn có thể sao chép nội dung của thư mục `dist/my-project-name` vào máy chủ web của bạn.
Vì các file này là tĩnh, bạn có thể lưu trữ chúng trên bất kỳ máy chủ web nào có khả năng phục vụ file, chẳng hạn như:

- Node.js
- Java
- .NET

Bạn có thể sử dụng bất kỳ backend nào như [Firebase](https://firebase.google.com/docs/hosting), [Google Cloud](https://cloud.google.com/solutions/web-hosting), hoặc [App Engine](https://docs.cloud.google.com/appengine/docs/standard/hosting-a-static-website).

### Lưu trữ cục bộ

Để vui, bạn có thể lưu trữ ứng dụng đã xây dựng trên máy của mình bằng gói [`http-server`](https://www.npmjs.com/package/http-server) bằng cách chạy lệnh sau sau khi chạy build:

```bash
npx http-server ./dist/todo/browser/ -o
```

Lệnh này phục vụ thư mục `dist/todo/browser` trên cổng `8080` để bạn có thể mở `http://127.0.0.1:8080` trong trình duyệt để xem ứng dụng đang chạy.
HTTP server cũng cho phép bạn truy cập ứng dụng tại địa chỉ IP của máy tính từ bất kỳ thiết bị nào khác trên mạng cục bộ, và địa chỉ này được liệt kê bên dưới địa chỉ `127.0.0.1` trong bảng điều khiển.

## Bước tiếp theo là gì?

Tại thời điểm này, bạn đã xây dựng được một ứng dụng cơ bản, nhưng hành trình Angular của bạn chỉ mới bắt đầu.
Bạn có thể tìm hiểu thêm bằng cách khám phá tài liệu Angular, chẳng hạn như:

- [Hướng dẫn](https://angular.dev/tutorials): Hướng dẫn chuyên sâu làm nổi bật các tính năng Angular, chẳng hạn như sử dụng dịch vụ, điều hướng và lấy dữ liệu từ máy chủ.
- Hướng dẫn [Thành phần](https://angular.dev/guide/components) Angular: Một loạt bài viết đề cập đến các chủ đề như vòng đời, tương tác thành phần và đóng gói chế độ xem.
- Hướng dẫn [Biểu mẫu](https://angular.dev/guide/forms): Các bài viết hướng dẫn bạn xây dựng các biểu mẫu phản ứng trong Angular, xác thực đầu vào và xây dựng biểu mẫu động.

## Tóm tắt

Đó là tất cả cho bây giờ. Hy vọng bạn đã có thời gian vui vẻ với Angular!

{{PreviousMenu("Learn_web_development/Core/Frameworks_libraries/Angular_filtering", "Learn_web_development/Core/Frameworks_libraries")}}
