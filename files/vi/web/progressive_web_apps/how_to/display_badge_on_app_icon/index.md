---
title: Hiển thị huy hiệu trên biểu tượng ứng dụng
slug: Web/Progressive_web_apps/How_to/Display_badge_on_app_icon
page-type: how-to
sidebar: pwasidebar
---

Các ứng dụng gốc trên hệ điều hành di động và máy tính có thể hiển thị huy hiệu trên biểu tượng ứng dụng để thông báo cho người dùng rằng có nội dung mới. Ví dụ, một ứng dụng email có thể hiển thị tổng số thư chưa đọc trong huy hiệu và cập nhật con số này ngay cả khi ứng dụng không chạy.

Sau đây là ví dụ cho thấy ứng dụng Mail trên thiết bị iOS với một huy hiệu ở góc trên bên phải:

![Khu vực dock trên màn hình chính iPhone, hiển thị huy hiệu trên biểu tượng ứng dụng Mail](./mail-badge-ios.png)

[Progressive Web Apps](/en-US/docs/Web/Progressive_web_apps) (PWA) cũng có thể hiển thị và cập nhật huy hiệu trên biểu tượng ứng dụng của chúng.

Việc hiển thị và cập nhật huy hiệu được thực hiện bằng [Badging API](/en-US/docs/Web/API/Badging_API). Bạn có thể gọi API này từ [service worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers) của ứng dụng để hiển thị hoặc cập nhật huy hiệu ngay cả khi ứng dụng không chạy.

## Hỗ trợ cho huy hiệu

Huy hiệu ứng dụng chỉ được hỗ trợ khi PWA được cài trên hệ điều hành chủ của nó. Huy hiệu xuất hiện trên biểu tượng ứng dụng, mà biểu tượng này chỉ tồn tại sau khi ứng dụng đã được cài.

> [!NOTE]
> Bài viết này tập trung vào các phương thức {{domxref("Navigator.setAppBadge()")}} và {{domxref("Navigator.clearAppBadge()")}} từ Badging API và bỏ qua `Navigator.setClientBadge` cùng `Navigator.clearClientBadge`. Mặc dù các phương thức này cũng được định nghĩa trong [đặc tả Badging API](https://w3c.github.io/badging/), chúng dùng để hiển thị huy hiệu trên tài liệu, không phải trên biểu tượng ứng dụng.

### Hỗ trợ trên máy tính

Trên hệ điều hành máy tính, huy hiệu chỉ được hỗ trợ trên Windows và macOS, và chỉ khi PWA được cài từ Chrome hoặc Edge. Dù Badging API được hỗ trợ trên các trình duyệt dựa trên Chromium trên Linux, huy hiệu không được hiển thị trên hệ điều hành này.

Safari và Firefox trên máy tính không hỗ trợ Badging API và không hỗ trợ cài đặt PWA.

### Hỗ trợ trên di động

Huy hiệu được hỗ trợ trong Safari trên iOS và iPadOS, bắt đầu từ iPadOS 16.4. Badging API không được hỗ trợ trên các trình duyệt dựa trên Chromium chạy trên Android. Thay vào đó, Android tự động hiển thị huy hiệu trên biểu tượng ứng dụng PWA khi có thông báo chưa đọc, giống như đối với các ứng dụng Android.

## Thực hành tốt nhất cho huy hiệu

Trước khi tìm hiểu cách dùng huy hiệu, hãy cân nhắc các thực hành tốt nhất sau để bảo đảm ứng dụng của bạn dùng huy hiệu theo cách hiệu quả và hữu ích nhất cho người dùng.

### Kiểm tra hỗ trợ

Để bảo đảm Badging API được trình duyệt và hệ điều hành của người dùng [hỗ trợ](#support_for_badges), và để tránh phát sinh lỗi JavaScript, hãy kiểm tra hỗ trợ trước khi dùng API:

```js
if (navigator.setAppBadge) {
  // The API is supported, use it.
} else {
  // The API is not supported, don't use it.
}
```

Đừng chỉ dựa vào huy hiệu để thông báo cho người dùng về sự xuất hiện của nội dung mới. Các trình duyệt hỗ trợ Badging API có thể được cài trên những hệ điều hành không hỗ trợ hiển thị huy hiệu. Ví dụ, dù Chrome hỗ trợ Badging API, huy hiệu sẽ không xuất hiện trên biểu tượng ứng dụng đã cài trên Linux.

### Yêu cầu quyền thông báo cho iOS và/hoặc iPadOS

Mặc dù huy hiệu thông báo được hỗ trợ trên iOS và iPadOS, huy hiệu sẽ không xuất hiện cho đến khi ứng dụng được cấp quyền thông báo. Để yêu cầu quyền thông báo, hãy gọi phương thức [`Notification.requestPermission()`](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API#getting_permission):

```js
Notification.requestPermission().then((result) => {
  console.log(result);
});
```

Ngoài ra, bạn có thể kiểm tra xem người dùng đã từng cấp quyền thông báo hay chưa bằng cách dùng [Permissions API](/en-US/docs/Web/API/Permissions_API).

### Dùng huy hiệu một cách tiết chế

Giống như thông báo, huy hiệu có thể là một cách rất hiệu quả để kéo người dùng quay lại với ứng dụng của bạn nếu được dùng tiết chế. Hãy bảo đảm chỉ dùng huy hiệu để báo hiệu nội dung mới thực sự quan trọng đối với người dùng.

### Cập nhật huy hiệu theo thời gian thực

Hãy bảo đảm cập nhật huy hiệu ứng dụng của bạn theo thời gian thực. Điều này có nghĩa là cập nhật số huy hiệu để phản ánh chính xác còn bao nhiêu mục mới mà người dùng thực sự chưa xem, và xóa huy hiệu khi không còn mục mới nào.

Ví dụ, nếu một ứng dụng email nhận thư mới ở nền, nó nên cập nhật huy hiệu để hiển thị đúng số thư chưa đọc trong hộp thư đến, có thể lọc bỏ các thư từ những thư mục khác như thư rác. Bạn có thể [cập nhật huy hiệu ở nền](#updating_the_badge_in_the_background) bằng cách dùng phương thức `navigator.setAppBadge()` từ service worker.

Khi người dùng khởi chạy ứng dụng và bắt đầu đọc thư, ứng dụng email nên cập nhật huy hiệu tương ứng bằng cách gọi `navigator.setAppBadge()` với số thư chưa đọc mới, hoặc bằng cách gọi `navigator.clearAppBadge()` khi không còn thư chưa đọc.

### Làm nổi bật nội dung mới trong ứng dụng

Khi ứng dụng của bạn nhận nội dung mới và thêm huy hiệu lên biểu tượng ứng dụng, hãy bảo đảm làm nổi bật nội dung mới đó cho người dùng khi họ mở ứng dụng.

Ví dụ, nếu ứng dụng email hiển thị số thư chưa đọc trên huy hiệu của biểu tượng ứng dụng, thì những thư đó nên được in đậm hoặc được làm nổi bật theo cách nào đó khi ứng dụng được mở.

## Hiển thị và cập nhật huy hiệu

Để hiển thị huy hiệu trên biểu tượng ứng dụng PWA của bạn nhằm cho biết số thư chưa đọc, hãy dùng phương thức {{domxref("Navigator.setAppBadge()")}}:

```js
// Check for support first.
if (navigator.setAppBadge) {
  // Display the number of unread messages.
  navigator.setAppBadge(numberOfUnreadMessages);
}
```

Bạn cũng có thể hiển thị huy hiệu trống bằng cùng phương thức này bằng cách bỏ qua tham số số lượng, hoặc đặt nó thành `0`:

```js
// Check for support first.
if (navigator.setAppBadge) {
  // Just display the badge, with no number in it.
  navigator.setAppBadge();
}
```

Để gỡ bỏ huy hiệu trên biểu tượng ứng dụng, hãy dùng phương thức {{domxref("Navigator.clearAppBadge()")}}:

```js
// Check for support first.
if (navigator.clearAppBadge) {
  // Remove the badge on the app icon.
  navigator.clearAppBadge();
}
```

## Cập nhật huy hiệu ở nền

Huy hiệu có thể hữu ích để kéo người dùng quay lại với ứng dụng của bạn khi họ chưa sử dụng ứng dụng. Điều này có nghĩa là ứng dụng của bạn phải có khả năng cập nhật huy hiệu ngay cả khi nó không chạy.

PWA có thể dùng các cơ chế sau để cập nhật ở nền và hiển thị, cập nhật, hoặc ẩn huy hiệu của chúng:

- [Push API](/en-US/docs/Web/API/Push_API)
  - : PWA có thể dùng API này để nhận thông điệp từ máy chủ ngay cả khi ứng dụng không chạy. Hầu hết trình duyệt yêu cầu phải hiển thị một thông báo mỗi khi nhận tin nhắn push. Điều này ổn cho một số trường hợp sử dụng (ví dụ, hiển thị thông báo khi cập nhật huy hiệu), nhưng khiến việc âm thầm cập nhật huy hiệu mà không hiển thị thông báo trở nên không thể. Ngoài ra, người dùng phải cấp quyền thông báo cho trang web của bạn để nhận tin nhắn push.
    Để biết thêm thông tin, xem phương thức [ServiceWorkerRegistration: showNotification() method](/en-US/docs/Web/API/ServiceWorkerRegistration/showNotification).
- [Background Synchronization API](/en-US/docs/Web/API/Background_Synchronization_API)
  - : PWA có thể dùng API này để chạy mã ở nền khi phát hiện có kết nối mạng ổn định.
- [Web Periodic Background Synchronization API](/en-US/docs/Web/API/Web_Periodic_Background_Synchronization_API)
  - : PWA có thể dùng API này để chạy mã ở nền theo các khoảng thời gian định kỳ.

Sau đây là ví dụ mã service worker cho thấy cách lắng nghe các tin nhắn Push từ máy chủ và cập nhật huy hiệu ứng dụng để phản ánh số thư chưa đọc:

```js
// Listen to "push" events in the service worker.
self.addEventListener("push", (event) => {
  // Extract the unread count from the push message data.
  const message = event.data.json();
  const unreadCount = message.unreadCount;

  // Set or clear the badge.
  if (navigator.setAppBadge) {
    if (unreadCount && unreadCount > 0) {
      navigator.setAppBadge(unreadCount);
    } else {
      navigator.clearAppBadge();
    }
  }
  // It's obligatory to show the notification to the user.
  self.registration.showNotification(`${unreadCount} unread messages`);
});
```

## Xem thêm

- [Cách tạo huy hiệu ứng dụng](https://web.dev/patterns/web-apps/badges/)
- [Badging cho biểu tượng ứng dụng](https://developer.chrome.com/docs/capabilities/web-apis/badging-api)
- [Tái tương tác với người dùng bằng huy hiệu, thông báo, và tin nhắn push](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps/how-to/notifications-badges)
- [Codelab: Xây dựng máy chủ thông báo push](https://web.dev/articles/push-notifications-server-codelab)
