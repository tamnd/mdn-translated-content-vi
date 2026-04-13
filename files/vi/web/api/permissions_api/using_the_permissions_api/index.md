---
title: Sử dụng Permissions API
slug: Web/API/Permissions_API/Using_the_Permissions_API
page-type: guide
---

{{DefaultAPISidebar("Permissions API")}}

Bài viết này cung cấp hướng dẫn cơ bản về cách sử dụng [Permissions API](/en-US/docs/Web/API/Permissions_API), cung cấp cách lập trình để truy vấn trạng thái của các quyền API được gán cho ngữ cảnh hiện tại.

## Vấn đề với việc yêu cầu quyền…

Quyền trên Web là điều cần thiết, nhưng không thú vị để xử lý với tư cách là nhà phát triển.

Trong lịch sử, các API khác nhau xử lý quyền của riêng chúng một cách không nhất quán. [Permissions API](/en-US/docs/Web/API/Permissions_API) cung cấp cách tiếp cận nhất quán cho nhà phát triển và cho phép họ triển khai trải nghiệm người dùng tốt hơn về quyền.
Cụ thể, nhà phát triển có thể sử dụng {{domxref("Permissions.query()")}} để kiểm tra xem quyền sử dụng một API cụ thể trong ngữ cảnh hiện tại đã được cấp, từ chối, hay yêu cầu quyền người dùng cụ thể thông qua lời nhắc.

## Một ví dụ đơn giản

Trong bài viết này, chúng ta đã tập hợp một bản demo đơn giản gọi là Location Finder. Nó sử dụng Geolocation để truy vấn vị trí hiện tại của người dùng và vẽ nó trên bản đồ Google:

![Screenshot showing a map of Greenfield, UK.](location-finder-with-permissions-api.png)

Bạn có thể [chạy ví dụ trực tiếp](https://chrisdavidmills.github.io/location-finder-permissions-api/), hoặc [xem mã nguồn trên GitHub](https://github.com/chrisdavidmills/location-finder-permissions-api/tree/gh-pages).

### Truy cập Permissions API

Thuộc tính {{domxref("Navigator.permissions")}} đã được thêm vào trình duyệt để cho phép truy cập vào đối tượng {{domxref("Permissions")}} toàn cục. Đối tượng này cuối cùng sẽ bao gồm các phương thức để truy vấn, yêu cầu và thu hồi quyền, mặc dù hiện tại nó chỉ chứa {{domxref("Permissions.query()")}}.

### Truy vấn trạng thái quyền

Trong ví dụ của chúng ta, chức năng Permissions được xử lý bởi một hàm, `handlePermission()`. Hàm này bắt đầu bằng cách truy vấn trạng thái quyền bằng cách sử dụng {{domxref("Permissions.query()")}}. Tùy thuộc vào giá trị của thuộc tính {{domxref("PermissionStatus.state", "state")}} của đối tượng {{domxref("PermissionStatus")}} được trả về khi promise giải quyết, nó phản ứng khác nhau:

- `"granted"`
  - : Nút "Enable Geolocation" bị ẩn, vì không cần thiết nếu Geolocation đã hoạt động.
- `"prompt"`
  - : Nút "Enable Geolocation" bị ẩn, vì không cần thiết nếu người dùng sẽ được nhắc cấp quyền cho Geolocation.
- `"denied"`
  - : Nút "Enable Geolocation" được hiển thị.

```js
function handlePermission() {
  navigator.permissions.query({ name: "geolocation" }).then((result) => {
    if (result.state === "granted") {
      report(result.state);
      geoBtn.style.display = "none";
    } else if (result.state === "prompt") {
      report(result.state);
      geoBtn.style.display = "none";
      navigator.geolocation.getCurrentPosition(
        revealPosition,
        positionDenied,
        geoSettings,
      );
    } else if (result.state === "denied") {
      report(result.state);
      geoBtn.style.display = "inline";
    }
    result.addEventListener("change", () => {
      report(result.state);
    });
  });
}

function report(state) {
  console.log(`Permission ${state}`);
}

handlePermission();
```

### Bộ mô tả quyền

Phương thức {{domxref("Permissions.query()")}} nhận một từ điển `PermissionDescriptor` làm tham số, bao gồm tên của API bạn quan tâm.

### Phản hồi với các thay đổi trạng thái quyền

Bạn sẽ nhận thấy rằng chúng ta đang lắng nghe sự kiện {{domxref("PermissionStatus.change_event", "change")}} trong code trên, được gắn vào đối tượng {{domxref("PermissionStatus")}}, điều này cho phép chúng ta phản hồi với bất kỳ thay đổi nào trong trạng thái quyền cho API chúng ta quan tâm.
