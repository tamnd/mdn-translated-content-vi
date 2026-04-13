---
title: "MouseEvent: MouseEvent() constructor"
short-title: MouseEvent()
slug: Web/API/MouseEvent/MouseEvent
page-type: web-api-constructor
browser-compat: api.MouseEvent.MouseEvent
---

{{APIRef("Pointer Events")}}

Hàm tạo **`MouseEvent()`** tạo một đối tượng {{domxref("MouseEvent")}} mới.

## Cú pháp

```js-nolint
new MouseEvent(type)
new MouseEvent(type, options)
```

### Thông số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Nó phân biệt chữ hoa chữ thường và các trình duyệt đặt nó thành `click`, `dblclick`, `mousedown`, `mouseenter`, `mouseleave`, `mousemove`, `mouseout`, `mouseover` hoặc `mouseup`.
- `options` {{optional_inline}}
  - : Một đối tượng, _ngoài các thuộc tính được xác định trong {{domxref("UIEvent/UIEvent", "UIEvent()")}}_, có thể có các thuộc tính sau:
    - `screenX` {{optional_inline}}
      - : Một số, mặc định là `0`, biểu thị vị trí ngang của sự kiện chuột trên màn hình của người dùng;
        việc đặt giá trị này không di chuyển con trỏ chuột.
    - `screenY` {{optional_inline}}
      - : Một số, mặc định là `0`, biểu thị vị trí dọc của sự kiện chuột trên màn hình của người dùng;
        việc đặt giá trị này không di chuyển con trỏ chuột.
    - `clientX` {{optional_inline}}
      - : Một số, mặc định là `0`, biểu thị vị trí ngang của sự kiện chuột trên cửa sổ client của người dùng;
        việc đặt giá trị này không di chuyển con trỏ chuột.
    - `clientY` {{optional_inline}}
      - : Một số, mặc định là `0`, biểu thị vị trí dọc của sự kiện chuột trên cửa sổ client của người dùng;
        việc đặt giá trị này không di chuyển con trỏ chuột.
    - `ctrlKey` {{optional_inline}}
      - : Giá trị boolean cho biết phím <kbd>Ctrl</kbd> có được nhấn đồng thời hay không. Mặc định là `false`.
    - `shiftKey` {{optional_inline}}
      - : Giá trị boolean cho biết phím <kbd>Shift</kbd> có được nhấn đồng thời hay không. Mặc định là `false`.
    - `altKey` {{optional_inline}}
      - : Giá trị boolean cho biết phím <kbd>Alt</kbd> có được nhấn đồng thời hay không. Mặc định là `false`.
    - `metaKey` {{optional_inline}}
      - : Giá trị boolean cho biết phím <kbd>Meta</kbd> có được nhấn đồng thời hay không. Mặc định là `false`.
    - `button` {{optional_inline}}
      - : Một số, mặc định là `0`, mô tả nút nào được nhấn trong các sự kiện liên quan đến việc nhấn hoặc nhả nút:

        | Giá trị | Ý nghĩa                                                          |
        | ------- | ---------------------------------------------------------------- |
        | `0`     | Nút chính được nhấn (thường là nút trái) hoặc chưa được khởi tạo |
        | `1`     | Nút phụ được nhấn (thường là nút giữa)                           |
        | `2`     | Nút phụ được nhấn (thường là nút phải)                           |

    - `buttons` {{optional_inline}}
      - : Một số, mặc định là `0`, mô tả các nút nào đang được nhấn khi sự kiện được kích hoạt:

        | Giá trị bit | Ý nghĩa                                  |
        | ----------- | ---------------------------------------- |
        | `0`         | Không có nút nào được nhấn               |
        | `1`         | Nút chính được nhấn (thường là nút trái) |
        | `2`         | Nút phụ được nhấn (thường là nút phải)   |
        | `4`         | Nút phụ được nhấn (thường là nút giữa)   |

    - `relatedTarget` {{optional_inline}}
      - : Một {{domxref("EventTarget")}}, mặc định là `null`, là phần tử vừa được rời khỏi
        (trong trường hợp {{domxref("Element/mouseenter_event", "mouseenter")}} hoặc {{domxref("Element/mouseover_event", "mouseover")}})
        hoặc đang được đi vào (trong trường hợp {{domxref("Element/mouseout_event", "mouseout")}} hoặc {{domxref("Element/mouseleave_event", "mouseleave")}}).
    - `region` {{non-standard_inline}} {{optional_inline}}
      - : Một chuỗi, mặc định là `null`, là ID của vùng chạm bị ảnh hưởng bởi sự kiện.
        Việc không có vùng chạm nào bị ảnh hưởng được biểu thị bằng giá trị `null`.

    Trong một số triển khai, việc truyền bất kỳ thứ gì khác ngoài số cho các trường `screen` và `client` sẽ gây ra {{jsxref("TypeError")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MouseEvent")}}, giao diện của các đối tượng mà nó tạo ra.
