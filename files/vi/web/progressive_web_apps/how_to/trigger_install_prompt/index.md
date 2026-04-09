---
title: Kích hoạt lời nhắc cài đặt từ PWA của bạn
slug: Web/Progressive_web_apps/How_to/Trigger_install_prompt
page-type: how-to
sidebar: pwasidebar
---

> [!WARNING]
> Kỹ thuật được mô tả ở đây phụ thuộc vào sự kiện {{domxref("Window.beforeinstallprompt_event", "beforeinstallprompt")}}, là không chuẩn và hiện chỉ được triển khai trong các trình duyệt dựa trên Chromium.

Theo mặc định, nếu người dùng truy cập trang web của bạn, và trình duyệt xác định rằng trang web đó [có thể cài như một PWA](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#installability), thì trình duyệt sẽ hiển thị một số giao diện tích hợp sẵn - ví dụ một biểu tượng trên thanh URL - để cài đặt trang web. Nếu người dùng bấm vào biểu tượng đó, trình duyệt sẽ hiển thị một lời nhắc cài đặt chứa tối thiểu [name](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/name) và [icon](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons) của ứng dụng. Nếu người dùng đồng ý cài ứng dụng, nó sẽ được cài đặt.

Tuy nhiên, bạn có thể tự triển khai giao diện trong ứng dụng để hỏi người dùng xem họ có muốn cài ứng dụng hay không, và việc này sẽ kích hoạt lời nhắc cài đặt. Lợi ích của cách này là:

- Bạn có thể cung cấp thêm ngữ cảnh về ứng dụng, giải thích cho người dùng vì sao họ có thể muốn cài nó dưới dạng PWA.
- Giao diện cài đặt trong ứng dụng có khả năng dễ được người dùng phát hiện và hiểu hơn giao diện mặc định của trình duyệt.

## Thêm giao diện cài đặt trong ứng dụng

Trước tiên, hãy thêm một số giao diện vào ứng dụng để cho biết rằng người dùng có thể cài nó. Ví dụ:

```html
<button id="install" hidden>Install</button>
```

Chúng ta đang đặt thuộc tính [`hidden`](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden) cho nút, vì nếu người dùng truy cập ứng dụng bằng trình duyệt không thể cài nó, chúng ta không muốn giao diện cài đặt hiển thị. Tiếp theo, chúng ta sẽ xem cách làm cho nút chỉ hiển thị trên các trình duyệt hỗ trợ cài PWA cục bộ.

## Lắng nghe beforeinstallprompt

Ngay khi trình duyệt xác định rằng nó có thể cài ứng dụng, nó sẽ kích hoạt sự kiện {{domxref("Window.beforeinstallprompt_event", "beforeinstallprompt")}} trong phạm vi toàn cục {{domxref("Window")}}.

Trong mã ứng dụng chính, chúng ta sẽ lắng nghe sự kiện này:

```js
// main.js

let installPrompt = null;
const installButton = document.querySelector("#install");

window.addEventListener("beforeinstallprompt", (event) => {
  event.preventDefault();
  installPrompt = event;
  installButton.removeAttribute("hidden");
});
```

Trình xử lý sự kiện ở đây làm ba việc:

- Gọi {{domxref("Event.preventDefault()","preventDefault()")}} trên sự kiện. Điều này ngăn trình duyệt hiển thị giao diện cài đặt riêng của nó.
- Lấy tham chiếu đến đối tượng sự kiện được truyền vào handler. Đây là một thể hiện của {{domxref("BeforeInstallPromptEvent")}}, và nó sẽ cho phép chúng ta nhắc người dùng cài ứng dụng.
- Hiện giao diện cài đặt trong ứng dụng của chúng ta bằng cách bỏ thuộc tính `hidden` khỏi nút.

Lưu ý rằng sự kiện sẽ không được kích hoạt nếu:

- PWA đã được cài sẵn.
- Ứng dụng không vượt qua [tiêu chí cài đặt PWA](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#installability).
- PWA không thể cài trên thiết bị hiện tại (ví dụ do thiếu quyền).

## Kích hoạt lời nhắc cài đặt

Tiếp theo, chúng ta cần thêm một trình xử lý click cho nút cài đặt trong ứng dụng:

```js
// main.js

installButton.addEventListener("click", async () => {
  if (!installPrompt) {
    return;
  }
  const result = await installPrompt.prompt();
  console.log(`Install prompt was: ${result.outcome}`);
  disableInAppInstallPrompt();
});

function disableInAppInstallPrompt() {
  installPrompt = null;
  installButton.setAttribute("hidden", "");
}
```

Biến `installPrompt` đã được khởi tạo bằng đối tượng `BeforeInstallPromptEvent` trong trình xử lý sự kiện `beforeinstallprompt` của chúng ta. Nếu vì bất kỳ lý do gì `installPrompt` chưa được khởi tạo, chúng ta sẽ không làm gì.

Ngược lại, chúng ta gọi phương thức {{domxref("BeforeInstallPromptEvent.prompt()", "prompt()")}} của nó. Điều này sẽ hiển thị lời nhắc cài đặt, và trả về một {{jsxref("Promise")}} mà kết quả của nó cho biết ứng dụng đã được cài hay chưa. Cụ thể, thuộc tính `outcome` của nó là `"accepted"` nếu người dùng chọn cài ứng dụng, hoặc `"dismissed"` nếu họ đóng lời nhắc.

Bằng cách nào đi nữa, chúng ta phải đặt lại trạng thái sau khi gọi `prompt()`, vì chúng ta chỉ có thể gọi nó một lần cho mỗi thể hiện `BeforeInstallPromptEvent`. Vì vậy, chúng ta đặt lại biến `installPrompt` và ẩn nút cài đặt مرة nữa.

## Phản hồi khi ứng dụng được cài

Tùy theo trình duyệt và nền tảng, trình duyệt vẫn có thể cung cấp giao diện riêng để cài ứng dụng. Điều này có nghĩa là ứng dụng vẫn có thể được cài mà không đi qua giao diện cài đặt trong ứng dụng của chúng ta. Nếu điều này xảy ra, chúng ta muốn tắt giao diện cài đặt trong ứng dụng, nếu không nó sẽ hiển thị trong một ứng dụng đã được cài rồi.

Để làm điều này, chúng ta có thể lắng nghe sự kiện {{domxref("Window.appinstalled_event", "appinstalled")}}, sự kiện này được kích hoạt trong phạm vi toàn cục {{domxref("Window")}} khi ứng dụng đã được cài:

```js
// main.js

window.addEventListener("appinstalled", () => {
  disableInAppInstallPrompt();
});

function disableInAppInstallPrompt() {
  installPrompt = null;
  installButton.setAttribute("hidden", "");
}
```

## Phản hồi khi các ứng dụng đặc thù nền tảng được cài

Nếu bạn có một phiên bản ứng dụng đặc thù nền tảng cùng với một ứng dụng web, và bạn muốn cá nhân hóa trải nghiệm ứng dụng web tùy theo việc ứng dụng đặc thù nền tảng đã được cài hay chưa. Bạn có thể không muốn mời người dùng cài PWA nếu họ đã có sẵn ứng dụng đặc thù nền tảng, và/hoặc bạn có thể muốn mời họ chuyển sang ứng dụng đặc thù nền tảng để xem nội dung.

Việc này có thể được xử lý bằng phương thức {{domxref("Navigator.getInstalledRelatedApps()")}}, phương thức cho phép bạn phát hiện các ứng dụng nền tảng liên quan đã được cài (hoặc PWA) và phản hồi phù hợp.

Ví dụ:

```js
const relatedApps = await navigator.getInstalledRelatedApps();

// Search for a specific installed platform-specific app
const psApp = relatedApps.find((app) => app.id === "com.example.myapp");

if (psApp) {
  // Update UI as appropriate
}
```

Phương thức này cũng có thể được kết hợp với `beforeinstallprompt` để ẩn giao diện cài đặt của trình duyệt dựa trên sự tồn tại của một ứng dụng đặc thù nền tảng:

```js
window.addEventListener("beforeinstallprompt", async (event) => {
  const relatedApps = await navigator.getInstalledRelatedApps();

  // Search for a specific installed platform-specific app
  const psApp = relatedApps.find((app) => app.id === "com.example.myapp");

  if (psApp) {
    event.preventDefault();
    // Update UI as appropriate
  }
});
```

## Xem thêm

- [Making PWAs installable](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable)
- Sự kiện {{domxref("Window.beforeinstallprompt_event", "beforeinstallprompt")}}
- [Cách cung cấp trải nghiệm cài đặt trong ứng dụng của riêng bạn](https://web.dev/articles/customize-install) trên web.dev (2021)
- [Lời nhắc cài đặt](https://web.dev/learn/pwa/installation-prompt) trên web.dev (2022)
