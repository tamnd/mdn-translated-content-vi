---
title: "Navigator: phương thức getInstalledRelatedApps()"
short-title: getInstalledRelatedApps()
slug: Web/API/Navigator/getInstalledRelatedApps
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Navigator.getInstalledRelatedApps
---

{{APIRef}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`getInstalledRelatedApps()`** trả về một lời hứa có thể giải quyết bằng một loạt đối tượng đại diện cho mọi ứng dụng dành riêng cho nền tảng có liên quan hoặc [Progressive Web Apps](/en-US/docs/Web/Progressive_web_apps) mà người dùng đã cài đặt. Điều này có thể được sử dụng để cá nhân hóa nội dung, chẳng hạn như xóa biểu ngữ "cài đặt ứng dụng của chúng tôi" khỏi ứng dụng web nếu ứng dụng dành riêng cho nền tảng và/hoặc PWA đã được cài đặt.

> [!LƯU Ý]
> Phương thức này phải được gọi trong [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts) cấp cao nhất, nghĩa là không được nhúng trong {{htmlelement("iframe")}}.

## Sự miêu tả

`getInstalledRelatedApps()` có thể được sử dụng để kiểm tra việc cài đặt các ứng dụng Universal Windows Platform (UWP), ứng dụng Android và PWA có liên quan đến ứng dụng web gọi phương thức này.

Để liên kết ứng dụng web đang gọi với một ứng dụng dành riêng cho nền tảng hoặc PWA, phải thực hiện hai điều:

1. Ứng dụng web gọi phải được chỉ định trong thành viên [`related_applications`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/related_applications) của [manifest file](/en-US/docs/Web/Progressive_web_apps/Manifest) của ứng dụng đó.
2. Ứng dụng dành riêng cho nền tảng hoặc PWA phải có mối quan hệ với ứng dụng gọi được xác định.

Việc xác định mối quan hệ được thực hiện theo cách khác tùy thuộc vào loại ứng dụng:

- Ứng dụng Android thực hiện việc này thông qua [Digital Asset Links system](https://developers.google.com/digital-asset-links/v1/getting-started).
- Ứng dụng Windows UWP thực hiện việc này thông qua [URI Handlers](https://learn.microsoft.com/en-us/windows/apps/develop/launch/web-to-app-linking).
- PWA thực hiện việc này thông qua:
  - Một mục nhập tự xác định bên trong thành viên bảng kê khai `related_applications` của chính nó, chỉ định các thuộc tính `platform` và `id`, trong trường hợp PWA kiểm tra trong cùng phạm vi nếu nó được cài đặt trên nền tảng cơ bản.
  - Tệp `assetlinks.json` trong thư mục [`/.well-known/`](https://datatracker.ietf.org/doc/html/rfc5785) trong trường hợp ứng dụng nằm ngoài phạm vi PWA đang kiểm tra xem nó có được cài đặt trên Android hay không.

Xem [Is your app installed? getInstalledRelatedApps() will tell you!](https://developer.chrome.com/docs/capabilities/get-installed-related-apps) để biết thêm chi tiết về cách xử lý từng trường hợp này.

> [!LƯU Ý]
> Hầu hết các trình duyệt hỗ trợ đều cung cấp giao diện người dùng cài đặt riêng khi phát hiện thấy PWA có thể cài đặt. PWA này sẽ không xuất hiện nếu đã được cài đặt — xem [Making PWAs installable > Installation from the web](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#installation_from_the_web). Điều này có thể được ngăn chặn bằng cách sử dụng sự kiện {{domxref("Window.beforeinstallprompt_event", "beforeinstallprompt")}}. Sự kiện này cũng có thể được kết hợp với `getInstalledRelatedApps()` để ngăn chặn dựa trên ứng dụng dành riêng cho nền tảng hiện có. Xem [Trigger installation from your PWA](/en-US/docs/Web/Progressive_web_apps/How_to/Trigger_install_prompt#responding_to_platform-specific_apps_being_installed) để biết thêm thông tin hữu ích.

## Cú pháp

```js-nolint
getInstalledRelatedApps()
```

### Thông số

Không có.

### Giá trị trả về

{{JSxRef("Promise")}} đáp ứng một loạt đối tượng đại diện cho mọi ứng dụng liên quan đã cài đặt. Mỗi đối tượng có thể chứa các thuộc tính sau:

- `id` {{optional_inline}}
  - : Một chuỗi đại diện cho ID được sử dụng để đại diện cho ứng dụng trên nền tảng được chỉ định. Hình thức chính xác của chuỗi sẽ khác nhau tùy theo nền tảng.
- `platform`
  - : Một chuỗi đại diện cho [platform](https://github.com/w3c/manifest/wiki/Platforms) (hệ sinh thái hoặc hệ điều hành) mà ứng dụng liên quan được liên kết với. Đây có thể là:
    - `"chrome_web_store"`: Ứng dụng [Google Chrome Web Store](https://chromewebstore.google.com/).
    - `"play"`: Ứng dụng [Google Play Store](https://play.google.com/store/games).
    - `"chromeos_play"`: Ứng dụng [ChromeOS Play](https://support.google.com/googleplay/answer/7021273).
    - `"webapp"`: Một [Progressive Web App](/en-US/docs/Web/Progressive_web_apps).
    - `"windows"`: Ứng dụng [Windows Store](https://apps.microsoft.com/?rtc=1&hl=en-us&gl=us).
    - `"f-droid"`: Ứng dụng [F-Droid](https://f-droid.org/).
    - `"amazon"`: Ứng dụng [Amazon App Store](https://www.amazon.com/gp/browse.html?node=2350149011).
- `url` {{optional_inline}}
  - : Một chuỗi đại diện cho URL được liên kết với ứng dụng. Đây thường là nơi bạn có thể đọc thông tin về nó và cài đặt nó.
- `version` {{optional_inline}}
  - : Một chuỗi đại diện cho phiên bản của ứng dụng liên quan.

Thông tin ứng dụng liên quan phải được chỉ định trước đó trong thành viên [`related_applications`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/related_applications) của [manifest file](/en-US/docs/Web/Progressive_web_apps/Manifest) của ứng dụng web đang gọi.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Phương thức này không được gọi trong ngữ cảnh duyệt cấp cao nhất.

## Ví dụ

```js
const relatedApps = await navigator.getInstalledRelatedApps();

// Dump all the returned related apps into a table in the console
console.table(relatedApps);

// Search for a specific installed platform-specific app
const psApp = relatedApps.find((app) => app.id === "com.example.myapp");

if (psApp && doesVersionSendPushMessages(psApp.version)) {
  // There's an installed platform-specific app that handles sending push messages
  // No need to handle this via the web app
  return;
}
```

> [!LƯU Ý]
> Trong ví dụ này, `doesVersionSendPushMessages()` là hàm lý thuyết do nhà phát triển xác định; nó không được cung cấp bởi trình duyệt.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Is your app installed? getInstalledRelatedApps() will tell you!](https://developer.chrome.com/docs/capabilities/get-installed-related-apps)
