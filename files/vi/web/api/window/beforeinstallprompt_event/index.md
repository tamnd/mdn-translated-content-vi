---
title: "Window: sự kiện beforeinstallprompt"
short-title: beforeinstallprompt
slug: Web/API/Window/beforeinstallprompt_event
page-type: web-api-event
browser-compat: api.Window.beforeinstallprompt_event
---

{{APIRef}}

Sự kiện **`beforeinstallprompt`** được kích hoạt khi trình duyệt phát hiện ra rằng một trang web có thể được [cài đặt dưới dạng Progressive Web App](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable).

Không có thời gian đảm bảo sự kiện này được kích hoạt, nhưng nó thường xảy ra khi tải trang.

Cách sử dụng điển hình cho sự kiện này là khi một ứng dụng web muốn cung cấp giao diện người dùng cài đặt riêng trong ứng dụng, thay vì giao diện chung do trình duyệt cung cấp. Điều này cho phép ứng dụng cung cấp thêm ngữ cảnh về ứng dụng, giải thích cho người dùng lý do tại sao họ có thể muốn cài đặt nó.

Trong kịch bản này, trình xử lý cho sự kiện này sẽ:

- Giữ tham chiếu đến đối tượng {{domxref("BeforeInstallPromptEvent")}} được truyền vào
- Hiển thị giao diện cài đặt trong ứng dụng (mặc định nên ẩn vì không phải tất cả trình duyệt đều hỗ trợ cài đặt).

Khi người dùng sử dụng giao diện cài đặt trong ứng dụng để cài đặt, giao diện cài đặt gọi phương thức {{domxref("BeforeInstallPromptEvent.prompt()", "prompt()")}} của đối tượng `BeforeInstallPromptEvent` đã lưu để hiển thị lời nhắc cài đặt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("beforeinstallprompt", (event) => { })

onbeforeinstallprompt = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("BeforeInstallPromptEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("BeforeInstallPromptEvent")}}

## Thuộc tính sự kiện

_Kế thừa thuộc tính từ cha, {{domxref("Event")}}._

- {{domxref("BeforeInstallPromptEvent.platforms")}} {{ReadOnlyInline}}{{Non-standard_Inline}} {{Experimental_Inline}}
  - : Trả về một mảng chuỗi chứa các nền tảng mà sự kiện được phân phối. Điều này được cung cấp cho các tác nhân người dùng muốn trình bày lựa chọn phiên bản cho người dùng, ví dụ: "web" hoặc "play" cho phép người dùng chọn giữa phiên bản web hoặc phiên bản Android.
- {{domxref("BeforeInstallPromptEvent.userChoice")}} {{ReadOnlyInline}}{{Non-standard_Inline}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} giải quyết thành một đối tượng mô tả lựa chọn của người dùng khi được nhắc cài đặt ứng dụng.

## Phương thức sự kiện

- {{domxref("BeforeInstallPromptEvent.prompt()")}}{{Non-standard_Inline}} {{Experimental_Inline}}
  - : Hiển thị lời nhắc hỏi người dùng có muốn cài đặt ứng dụng không. Phương thức này trả về một {{jsxref("Promise")}} giải quyết thành một đối tượng mô tả lựa chọn của người dùng khi được nhắc cài đặt ứng dụng.

## Ví dụ

Trong ví dụ sau, ứng dụng cung cấp nút cài đặt riêng với `id` là `"install"`. Ban đầu nút này bị ẩn.

```html
<button id="install" hidden>Cài đặt</button>
```

Trình xử lý `beforeinstallprompt`:

- Hủy sự kiện, điều này ngăn trình duyệt hiển thị giao diện cài đặt riêng trên một số nền tảng
- Gán đối tượng `BeforeInstallPromptEvent` vào một biến để sử dụng sau
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

Khi được nhấp, nút cài đặt của ứng dụng sẽ:

- Gọi phương thức {{domxref("BeforeInstallPromptEvent.prompt()", "prompt()")}} của đối tượng sự kiện đã lưu, để kích hoạt lời nhắc cài đặt.
- Đặt lại trạng thái bằng cách xóa biến `installPrompt` và ẩn nút lại.

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

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("BeforeInstallPromptEvent.prompt")}}
- {{domxref("BeforeInstallPromptEvent")}}
