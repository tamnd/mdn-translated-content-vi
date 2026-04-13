---
title: ViewTransitionTypeSet
slug: Web/API/ViewTransitionTypeSet
page-type: web-api-interface
browser-compat: api.ViewTransitionTypeSet
---

{{APIRef("View Transition API")}}

Giao diện **`ViewTransitionTypeSet`** của {{domxref("View Transition API", "View Transition API", "", "nocode")}} là một [đối tượng giống set](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis) đại diện cho các loại của một view transition đang hoạt động. Điều này cho phép các loại được truy vấn hoặc sửa đổi linh hoạt trong quá trình transition.

Đối tượng `ViewTransitionTypeSet` có thể được truy cập thông qua thuộc tính {{domxref("ViewTransition.types")}}.

Các liên kết thuộc tính và phương thức bên dưới liên kết đến tài liệu đối tượng JavaScript {{jsxref("Set")}}.

## Thuộc tính phiên bản

- {{jsxref("Set.prototype.size")}}
  - : Trả về số lượng giá trị trong set.

## Phương thức phiên bản

- {{jsxref("Set.prototype.add")}}
  - : Chèn giá trị được chỉ định vào set này, nếu nó chưa có.
- {{jsxref("Set.prototype.clear()")}}
  - : Xóa tất cả giá trị khỏi set.
- {{jsxref("Set.prototype.delete()")}}
  - : Xóa giá trị được chỉ định khỏi set này, nếu nó có trong set.
- {{jsxref("Set.prototype.entries()")}}
  - : Trả về một đối tượng iterator mới chứa **mảng `[value, value]`** cho mỗi phần tử trong set, theo thứ tự chèn.
- {{jsxref("Set.prototype.forEach()")}}
  - : Gọi hàm callback một lần cho mỗi giá trị có trong set, theo thứ tự chèn.
- {{jsxref("Set.prototype.has()")}}
  - : Trả về giá trị boolean cho biết liệu giá trị được chỉ định có tồn tại trong set hay không.
- {{jsxref("Set.prototype.keys()")}}
  - : Bí danh cho {{jsxref("Set.prototype.values()")}}.
- {{jsxref("Set.prototype.values()")}}
  - : Trả về một đối tượng iterator mới tạo ra **các giá trị** cho mỗi phần tử trong set, theo thứ tự chèn.
- [`Set.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/Symbol.iterator)
  - : Trả về một đối tượng iterator mới tạo ra **các giá trị** cho mỗi phần tử trong set, theo thứ tự chèn.

## Ví dụ

```js
// Bắt đầu một view transition
const vt = document.startViewTransition({
  update: updateTheDOMSomehow,
  types: ["slideLeft", "fadeOut", "flipVertical"],
});

// Thêm một loại khác
vt.types.add("flipHorizontal");

// Xóa một loại
vt.types.delete("flipVertical");

// Trả về số lượng loại trong set
console.log(vt.types.size);

// In mỗi loại ra console
vt.types.forEach((type) => console.log(type));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ViewTransition.types")}}
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- [Using the View Transition API](/en-US/docs/Web/API/View_Transition_API/Using)
- [Using view transition types](/en-US/docs/Web/API/View_Transition_API/Using_types)
- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
