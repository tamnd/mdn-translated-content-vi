---
title: "Screen: thuộc tính orientation"
short-title: orientation
slug: Web/API/Screen/orientation
page-type: web-api-instance-property
browser-compat: api.Screen.orientation
---

{{APIRef("Screen Orientation API")}}

Thuộc tính chỉ đọc **`orientation`** của giao diện {{DOMxRef("Screen")}} trả về hướng hiện tại của màn hình.

## Giá trị

Một instance của {{DOMxRef("ScreenOrientation")}} đại diện cho hướng của màn hình.

Lưu ý rằng các phiên bản cũ có tiền tố trả về một chuỗi tương đương với {{DOMxRef("ScreenOrientation.type")}}.

## Ví dụ

```js
switch (screen.orientation.type) {
  case "landscape-primary":
    console.log("Trông ổn đấy.");
    break;
  case "landscape-secondary":
    console.log("Ừm... màn hình đang bị lộn ngược!");
    break;
  case "portrait-secondary":
  case "portrait-primary":
    console.log("Ừm... bạn nên xoay thiết bị sang chế độ ngang");
    break;
  default:
    console.log("API hướng không được hỗ trợ trong trình duyệt này :(");
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("ScreenOrientation")}}
- Sự kiện {{DOMxRef("Screen.orientationchange_event", "orientationchange")}}
- [Quản lý hướng màn hình](/en-US/docs/Web/API/CSS_Object_Model/Managing_screen_orientation)
