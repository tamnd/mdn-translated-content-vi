---
title: "Screen: thuộc tính availHeight"
short-title: availHeight
slug: Web/API/Screen/availHeight
page-type: web-api-instance-property
browser-compat: api.Screen.availHeight
---

{{APIRef("CSSOM view API")}}

Thuộc tính chỉ đọc **`availHeight`** của giao diện {{DOMxRef("Screen")}} trả về chiều cao, tính bằng CSS pixels, của không gian khả dụng cho nội dung Web trên màn hình. Vì {{DOMxRef("Screen")}} được hiển thị trên giao diện {{DOMxRef("Window")}} thông qua thuộc tính {{DOMxRef("Window.screen", "window.screen")}}, bạn truy cập `availHeight` bằng `window.screen.availHeight`.

Tương tự, bạn có thể sử dụng {{DOMxRef("Screen.availWidth")}} để lấy số pixel khả dụng theo chiều ngang cho trình duyệt sử dụng.

## Giá trị

Một giá trị số cho biết số CSS pixels chiều cao của không gian khả dụng trên màn hình. Giá trị này không thể lớn hơn giá trị của {{DOMxRef("Screen.height", "window.screen.height")}}, và sẽ nhỏ hơn nếu thiết bị hoặc user agent dự trữ bất kỳ không gian dọc nào cho chính nó.

Ví dụ, trên máy Mac có Dock nằm ở cuối màn hình (mặc định), giá trị của `availHeight` xấp xỉ giá trị của `height` (tổng chiều cao màn hình tính bằng CSS pixels) trừ đi chiều cao của Dock và thanh menu, như thấy trong sơ đồ bên dưới. Chúng chỉ chiếm `availHeight` nếu chúng luôn hiển thị: nếu trang ở chế độ toàn màn hình, hoặc nếu dock được cấu hình tự động ẩn và hiện, thì chúng sẽ không được tính vào `availHeight`.

![Sơ đồ minh họa mối quan hệ giữa Screen.availHeight và Screen.height cùng các thành phần trên màn hình](availheight-diagram.svg)

## Ví dụ

Nếu ứng dụng web của bạn cần mở một cửa sổ mới, chẳng hạn như bảng công cụ có thể chứa nhiều bảng điều khiển, và muốn định vị nó để chiếm toàn bộ không gian dọc khả dụng, bạn có thể thực hiện bằng mã tương tự như dưới đây.

Trong cửa sổ chính, khi đến lúc mở các bảng điều khiển, mã như sau được sử dụng.

```js
const paletteWindow = window.open(
  "panels.html",
  "Panels",
  "left=0, top=0, width=200",
);
```

Cửa sổ Panels có HTML riêng trong `panels.html`, có mã JavaScript riêng, được thực thi ngay khi cửa sổ được tạo. Nó thậm chí không cần đợi bất kỳ sự kiện cụ thể nào (hoặc bất kỳ sự kiện nào). Mã đó xử lý việc thay đổi kích thước cửa sổ dựa trên không gian khả dụng:

```js
window.outerHeight = window.screen.availHeight;
```

Kết quả là một cái gì đó tương tự như bên dưới. Lưu ý cửa sổ Panels lấp đầy toàn bộ không gian dọc khả dụng ở bên trái màn hình.

![Ảnh chụp màn hình ví dụ cho Screen.availHeight](screen-availheight.png)

Trên hệ thống Windows, điều này sẽ hoạt động tương tự, bằng cách mở cửa sổ và thay đổi kích thước theo chiều dọc để sử dụng toàn bộ không gian dọc khả dụng, chừa chỗ cho taskbar và bất kỳ thành phần giao diện nào khác dự trữ không gian.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Window")}}
- {{DOMxRef("Screen")}}
- {{DOMxRef("Screen.availWidth")}}
- {{DOMxRef("Window.innerHeight")}}
