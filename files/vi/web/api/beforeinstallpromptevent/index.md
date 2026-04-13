---
title: BeforeInstallPromptEvent
slug: Web/API/BeforeInstallPromptEvent
page-type: web-api-interface
status:
  - experimental
  - non-standard
browser-compat: api.BeforeInstallPromptEvent
---

{{APIRef}}{{SeeCompatTable}}{{Non-standard_header}}

**`BeforeInstallPromptEvent`** là giao diện của sự kiện {{domxref("Window.beforeinstallprompt_event", "beforeinstallprompt")}} được kích hoạt trên đối tượng {{domxref("Window")}} trước khi người dùng được nhắc "cài đặt" một website lên màn hình chính trên thiết bị di động.

Giao diện này kế thừa từ giao diện {{domxref("Event")}}.

{{InheritanceDiagram}}

## Hàm tạo

- {{domxref("BeforeInstallPromptEvent.BeforeInstallPromptEvent","BeforeInstallPromptEvent()")}}{{Non-standard_Inline}} {{Experimental_Inline}}
  - : Tạo một đối tượng `BeforeInstallPromptEvent` mới.

## Thuộc tính thực thể

_Kế thừa các thuộc tính từ đối tượng cha của nó, {{domxref("Event")}}._

- {{domxref("BeforeInstallPromptEvent.platforms")}} {{ReadOnlyInline}}{{Non-standard_Inline}} {{Experimental_Inline}}
  - : Trả về một mảng các chuỗi chứa những nền tảng mà sự kiện được gửi tới. Điều này được cung cấp cho các user agent muốn đưa ra cho người dùng lựa chọn giữa nhiều phiên bản, chẳng hạn như "web" hoặc "play", để người dùng có thể chọn giữa phiên bản web hoặc phiên bản Android.
- {{domxref("BeforeInstallPromptEvent.userChoice")}} {{ReadOnlyInline}}{{Non-standard_Inline}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được resolve thành một đối tượng mô tả lựa chọn của người dùng khi họ được nhắc cài đặt ứng dụng.

## Phương thức thực thể

- {{domxref("BeforeInstallPromptEvent.prompt()")}}{{Non-standard_Inline}} {{Experimental_Inline}}
  - : Hiển thị một lời nhắc hỏi người dùng xem họ có muốn cài đặt ứng dụng hay không. Phương thức này trả về một {{jsxref("Promise")}} được resolve thành một đối tượng mô tả lựa chọn của người dùng khi họ được nhắc cài đặt ứng dụng.

## Ví dụ

Trong ví dụ sau, một ứng dụng cung cấp nút cài đặt riêng của nó, có `id` là `"install"`. Ban đầu nút này bị ẩn.

```html
<button id="install" hidden>Install</button>
```

Trình xử lý `beforeinstallprompt`:

- Hủy sự kiện để ngăn trình duyệt hiển thị giao diện cài đặt riêng của nó trên một số nền tảng
- Gán đối tượng `BeforeInstallPromptEvent` vào một biến để có thể dùng lại về sau
- Hiển thị nút cài đặt của ứng dụng.

```js
let installPrompt = null;
const installButton = document.querySelector("#install");

window.addEventListener("beforeinstallprompt", (event) => {
  event.preventDefault();
  installPrompt = event;
  installButton.removeAttribute("hidden");
});
```

Khi được nhấp, nút cài đặt của ứng dụng:

- Gọi phương thức {{domxref("BeforeInstallPromptEvent.prompt()", "prompt()")}} của đối tượng sự kiện đã lưu để kích hoạt lời nhắc cài đặt.
- Đặt lại trạng thái bằng cách xóa biến `installPrompt` và tự ẩn đi lần nữa.

```js
installButton.addEventListener("click", async () => {
  if (!installPrompt) {
    return;
  }
  const result = await installPrompt.prompt();
  console.log(`Install prompt was: ${result.outcome}`);
  installPrompt = null;
  installButton.setAttribute("hidden", "");
});
```

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Làm cho PWA có thể cài đặt](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable)
- [How to provide your own in-app install experience](https://web.dev/articles/customize-install) trên web.dev (2021)
