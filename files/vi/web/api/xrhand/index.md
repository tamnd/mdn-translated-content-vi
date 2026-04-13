---
title: XRHand
slug: Web/API/XRHand
page-type: web-api-interface
browser-compat: api.XRHand
---

{{APIRef("WebXR Device API")}}

Giao diện **`XRHand`** là một pair iterator (một ordered map) với khóa là các khớp của bàn tay và giá trị là một {{domxref("XRJointSpace")}}.

`XRHand` được trả về bởi {{domxref("XRInputSource.hand")}}.

## Thuộc tính phiên bản

- `size` {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về `25`, kích thước của pair iterator.

## Phương thức phiên bản

Đối tượng `XRHand` là một pair iterator. Nó có thể được sử dụng trực tiếp trong cấu trúc {{jsxref("Statements/for...of", "for...of")}}. `for (const joint of myHand)` tương đương với `for (const joint of myHand.entries())`.
Tuy nhiên, nó không phải là đối tượng giống map, do đó bạn không có các phương thức `clear()`, `delete()`, `has()`, và `set()`.

- `entries()` {{Experimental_Inline}}
  - : Trả về một iterator với các cặp khớp tay/{{domxref("XRJointSpace")}} cho từng phần tử.
    Xem {{jsxref("Map.prototype.entries()")}} để biết thêm chi tiết.
- `forEach()` {{Experimental_Inline}}
  - : Chạy một hàm được cung cấp một lần cho mỗi cặp khớp tay/{{domxref("XRJointSpace")}}.
    Xem {{jsxref("Map.prototype.forEach()")}} để biết thêm chi tiết.
- `get()` {{Experimental_Inline}}
  - : Trả về một {{domxref("XRJointSpace")}} cho một khớp tay được cho hoặc {{jsxref("undefined")}} nếu không có khóa khớp tay nào như vậy trong map.
    Xem {{jsxref("Map.prototype.get()")}} để biết thêm chi tiết.
- `keys()` {{Experimental_Inline}}
  - : Trả về một iterator với tất cả các khóa khớp tay.
    Xem {{jsxref("Map.prototype.keys()")}} để biết thêm chi tiết.
- `values()` {{Experimental_Inline}}
  - : Trả về một iterator với tất cả các giá trị {{domxref("XRJointSpace")}}.
    Xem {{jsxref("Map.prototype.values()")}} để biết thêm chi tiết.

## Các khớp của bàn tay

Đối tượng `XRHand` chứa các khớp bàn tay sau:

![Hand](hand.svg)

| Khớp bàn tay                       | Chỉ số |
| ---------------------------------- | ------ |
| wrist                              | 0      |
| thumb-metacarpal                   | 1      |
| thumb-phalanx-proximal             | 2      |
| thumb-phalanx-distal               | 3      |
| thumb-tip                          | 4      |
| index-finger-metacarpal            | 5      |
| index-finger-phalanx-proximal      | 6      |
| index-finger-phalanx-intermediate  | 7      |
| index-finger-phalanx-distal        | 8      |
| index-finger-tip                   | 9      |
| middle-finger-metacarpal           | 10     |
| middle-finger-phalanx-proximal     | 11     |
| middle-finger-phalanx-intermediate | 12     |
| middle-finger-phalanx-distal       | 13     |
| middle-finger-tip                  | 14     |
| ring-finger-metacarpal             | 15     |
| ring-finger-phalanx-proximal       | 16     |
| ring-finger-phalanx-intermediate   | 17     |
| ring-finger-phalanx-distal         | 18     |
| ring-finger-tip                    | 19     |
| pinky-finger-metacarpal            | 20     |
| pinky-finger-phalanx-proximal      | 21     |
| pinky-finger-phalanx-intermediate  | 22     |
| pinky-finger-phalanx-distal        | 23     |
| pinky-finger-tip                   | 24     |

## Ví dụ

### Sử dụng đối tượng `XRHand`

```js
const wristJoint = inputSource.hand.get("wrist");
const indexFingerTipJoint = inputSource.hand.get("index-finger-tip");

for (const [joint, jointSpace] of inputSource.hand) {
  console.log(joint);
  console.log(jointSpace);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRInputSource.hand")}}
