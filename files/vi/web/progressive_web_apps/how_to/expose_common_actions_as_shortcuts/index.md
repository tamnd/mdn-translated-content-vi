---
title: Hiển thị các thao tác ứng dụng phổ biến dưới dạng lối tắt
slug: Web/Progressive_web_apps/How_to/Expose_common_actions_as_shortcuts
page-type: how-to
sidebar: pwasidebar
---

Nhiều hệ điều hành hỗ trợ hiển thị menu lối tắt, hay jump-list, khi người dùng bấm chuột phải hoặc nhấn giữ vào biểu tượng ứng dụng. Ví dụ, trên Windows, bấm chuột phải vào bất kỳ chương trình ghim nào trên thanh tác vụ sẽ hiển thị một danh sách các thao tác riêng cho chương trình và các tệp đã mở gần đây:

![Thanh tác vụ trong Windows, hiển thị một số ứng dụng được ghim. Biểu tượng ứng dụng Firefox đã được bấm chuột phải, và jump list được hiển thị, cho thấy các tab thường dùng và các tác vụ phổ biến](./jump-list.png)

Trên Android, nhấn giữ biểu tượng ứng dụng cũng hiển thị danh sách các thao tác ứng dụng phổ biến:

![Trình khởi chạy ứng dụng Android, hiển thị một biểu tượng ứng dụng đã được nhấn giữ. Menu lối tắt được hiển thị, cho thấy các thao tác phổ biến](./android-shortcuts.png)

[Progressive Web Apps (PWAs)](/en-US/docs/Web/Progressive_web_apps) có thể được cài trên thiết bị giống như các ứng dụng gốc của nền tảng và, giống như các ứng dụng gốc, chúng cũng có thể định nghĩa menu lối tắt ứng dụng để cho phép người dùng truy cập các thao tác phổ biến.

Các lối tắt chỉ được hiển thị khi bấm chuột phải hoặc nhấn giữ biểu tượng ứng dụng, nghĩa là chúng chỉ khả dụng sau khi PWA đã được cài trên thiết bị của người dùng. Để tìm hiểu cách làm PWA của bạn có thể cài đặt được, xem [making PWAs installable](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable).

## Vì sao nên dùng lối tắt?

Việc định nghĩa các lối tắt cho PWA có thể giúp người dùng làm việc hiệu quả hơn bằng cách cho phép họ truy cập các thao tác chính của ứng dụng trực tiếp từ màn hình chính. Ngoài ra, định nghĩa lối tắt còn có thể giúp PWA của bạn giống ứng dụng gốc của nền tảng hơn và do đó quen thuộc hơn với người dùng.

## Định nghĩa lối tắt trong web app manifest

Để định nghĩa lối tắt cho PWA của bạn, hãy dùng thành phần [`shortcuts`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/shortcuts) của [web app manifest](/en-US/docs/Web/Progressive_web_apps/Manifest). Thành phần này là một mảng các đối tượng định nghĩa tên và URL của từng lối tắt, cũng như các thuộc tính tùy chọn như tên ngắn, mô tả, và biểu tượng. Ví dụ, sau đây là web app manifest của một ứng dụng lịch định nghĩa hai lối tắt:

```json
{
  "name": "Calendar",
  "start_url": "/",
  "display": "standalone",
  "icons": [
    {
      "src": "images/icon-256.png",
      "sizes": "256x256",
      "type": "image/png"
    }
  ],
  "shortcuts": [
    {
      "name": "New event",
      "url": "/new-event"
    },
    {
      "name": "View today's events",
      "url": "/today"
    }
  ]
}
```

Các thuộc tính quan trọng nhất của mỗi đối tượng lối tắt là:

- `name`
  - : Tên của lối tắt, được hiển thị trong menu lối tắt. Hãy bảo đảm tên đủ ngắn nhưng vẫn mô tả đủ rõ để người dùng biết lối tắt làm gì.
- `url`
  - : URL để khởi chạy PWA khi người dùng chọn lối tắt. URL này có thể là tuyệt đối, trong trường hợp đó nó պետք phải tồn tại trong [phạm vi](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope) của web app manifest. URL cũng có thể là tương đối, trong trường hợp đó nó sẽ được phân giải tương đối với [start URL](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/start_url) của PWA.

Các thuộc tính khác của đối tượng lối tắt đều là tùy chọn, nhưng bạn nên cân nhắc cung cấp chúng để lối tắt hữu ích hơn cho người dùng:

- `short_name`
  - : Tên ngắn của lối tắt, được hiển thị khi không đủ chỗ để hiển thị tên đầy đủ.
- `description`
  - : Mô tả của lối tắt. Chuỗi này có thể được công nghệ hỗ trợ, chẳng hạn trình đọc màn hình, truy cập để giúp người dùng hiểu lối tắt làm gì.
- `icons`
  - : Một mảng các đối tượng hình ảnh dùng để hiển thị trong menu lối tắt. Mỗi đối tượng hình ảnh được xử lý giống như thành phần [`icons`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons) của web app manifest, và có thể được dùng để cung cấp biểu tượng có kích thước khác nhau cho các yêu cầu thiết bị khác nhau.

## Xem thêm

- Thành phần manifest [`shortcuts`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/shortcuts)
- [Hoàn thành công việc nhanh hơn với lối tắt ứng dụng](https://web.dev/articles/app-shortcuts) trên web.dev (2022)
- [Định nghĩa lối tắt ứng dụng](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps/how-to/shortcuts) trên learn.microsoft.com (2023)
