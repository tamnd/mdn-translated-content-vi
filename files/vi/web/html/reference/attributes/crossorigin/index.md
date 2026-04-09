---
title: "HTML attribute: crossorigin"
short-title: crossorigin
slug: Web/HTML/Reference/Attributes/crossorigin
page-type: html-attribute
browser-compat:
  - html.elements.audio.crossorigin
  - html.elements.img.crossorigin
  - html.elements.link.crossorigin
  - html.elements.script.crossorigin
  - html.elements.video.crossorigin
spec-urls: https://html.spec.whatwg.org/multipage/urls-and-fetching.html#cors-settings-attributes
sidebar: htmlsidebar
---

Thuộc tính **`crossorigin`**, hợp lệ trên các phần tử {{HTMLElement("audio")}}, {{HTMLElement("img")}}, {{HTMLElement("link")}}, {{HTMLElement("script")}} và {{HTMLElement("video")}}, cung cấp hỗ trợ cho [CORS](/en-US/docs/Web/HTTP/Guides/CORS), xác định cách phần tử xử lý các yêu cầu cross-origin, từ đó cho phép cấu hình các yêu cầu CORS cho dữ liệu được tải về của phần tử. Tùy thuộc vào phần tử, thuộc tính có thể là thuộc tính cài đặt CORS.

Thuộc tính nội dung `crossorigin` trên các phần tử phương tiện là thuộc tính cài đặt CORS.

Các thuộc tính này là [liệt kê](/en-US/docs/Glossary/Enumerated), và có các giá trị có thể có sau:

- `anonymous`
  - : Yêu cầu sử dụng tiêu đề CORS và cờ thông tin xác thực được đặt thành `'same-origin'`. Không có trao đổi **thông tin xác thực người dùng** qua cookie, chứng chỉ TLS phía máy khách hoặc xác thực HTTP, trừ khi điểm đến là cùng origin.
- `use-credentials`
  - : Yêu cầu sử dụng tiêu đề CORS, cờ thông tin xác thực được đặt thành `'include'` và **thông tin xác thực người dùng** luôn được bao gồm.
- `""`
  - : Đặt tên thuộc tính thành giá trị rỗng, như `crossorigin` hoặc `crossorigin=""`, giống với `anonymous`.

Từ khóa không hợp lệ và chuỗi rỗng sẽ được xử lý như từ khóa `anonymous`.

Theo mặc định (tức là khi thuộc tính không được chỉ định), CORS hoàn toàn không được sử dụng. User agent sẽ không yêu cầu quyền truy cập đầy đủ vào tài nguyên và trong trường hợp yêu cầu cross-origin, một số hạn chế nhất định sẽ được áp dụng dựa trên loại phần tử liên quan:

<table class="no-markdown">
  <tbody>
    <tr>
      <td class="header">Phần tử</td>
      <td class="header">Hạn chế</td>
    </tr>
    <tr>
      <td><code>img</code>, <code>audio</code>, <code>video</code></td>
      <td>
        Khi tài nguyên được đặt trong {{HTMLElement("canvas")}}, phần tử được đánh dấu là <a href="/en-US/docs/Web/HTML/How_to/CORS_enabled_image#security_and_tainted_canvases"><em>bị nhiễm</em></a>.
      </td>
    </tr>
    <tr>
      <td><code>script</code></td>
      <td>
        Quyền truy cập vào ghi lỗi qua {{domxref('Window.error_event', 'window.onerror')}} sẽ bị giới hạn.
      </td>
    </tr>
    <tr>
      <td><code>link</code></td>
      <td>
        Yêu cầu không có tiêu đề <code>crossorigin</code> phù hợp có thể bị loại bỏ.
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Thuộc tính `crossorigin` không được hỗ trợ cho [`rel="icon"`](/en-US/docs/Web/HTML/Reference/Attributes/rel#icon) trong các trình duyệt dựa trên Chromium. Xem [vấn đề Chromium đang mở](https://crbug.com/1121645).

## Ví dụ

### `crossorigin` với phần tử `<script>`

Bạn có thể sử dụng phần tử {{HTMLElement("script")}} sau đây để yêu cầu trình duyệt thực thi script `https://example.com/example-framework.js` mà không gửi thông tin xác thực người dùng.

```html
<script
  src="https://example.com/example-framework.js"
  crossorigin="anonymous"></script>
```

### Web manifest với thông tin xác thực

Giá trị `use-credentials` phải được sử dụng khi tải [manifest](/en-US/docs/Web/Progressive_web_apps/Manifest) yêu cầu thông tin xác thực, ngay cả khi tệp từ cùng origin.

```html
<link rel="manifest" href="/app.webmanifest" crossorigin="use-credentials" />
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [Thuộc tính HTML: `rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel)
