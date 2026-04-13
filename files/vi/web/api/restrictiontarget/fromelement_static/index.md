---
title: "RestrictionTarget: phương thức tĩnh fromElement()"
short-title: fromElement()
slug: Web/API/RestrictionTarget/fromElement_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.RestrictionTarget.fromElement_static
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức tĩnh **`fromElement()`** của giao diện {{domxref("RestrictionTarget")}} trả về phiên bản {{domxref("RestrictionTarget")}} có thể được sử dụng để giới hạn track video bị capture vào một phần tử DOM cụ thể (cùng với các phần tử con của nó).

## Cú pháp

```js-nolint
RestrictionTarget.fromElement(element)
```

### Tham số

- `element`
  - : Tham chiếu đến {{domxref("Element")}} bạn muốn sử dụng làm restriction target. Để một phần tử có thể được dùng làm restriction target, nó phải:
    - Tạo thành [stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context).
    - Được làm phẳng trong không gian 3D (ví dụ: không được áp dụng bất kỳ [biến đổi](/en-US/docs/Web/CSS/Guides/Transforms) 3D nào).
    - Được hiển thị (ví dụ: không nằm ngoài màn hình hoặc ẩn qua `display: none`).
    - Chứa chỉ một hộp fragment (ví dụ: không bị phân tách trên nhiều dòng).

    Nếu không đáp ứng các tiêu chí trên, nó được coi là **không đủ điều kiện cho restriction**.

    Ngoài ra, phần tử sẽ không được capture nếu track đang bị giới hạn có các bản sao (tức là được tạo bởi {{domxref("BrowserCaptureMediaStreamTrack.clone()")}}) hoặc được capture từ tab khác so với tab hiện tại của người dùng.

> [!NOTE]
> Khi phần tử được capture, bất kỳ giá trị alpha-channel nào được đặt trên nó đều không được bao gồm. Nếu phần tử restriction target bán trong suốt, nó sẽ xuất hiện hoàn toàn không trong suốt trong capture.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải thành đối tượng {{domxref("RestrictionTarget")}}, sau đó có thể được truyền vào {{domxref("BrowserCaptureMediaStreamTrack.restrictTo()")}} để giới hạn video được capture trong track vào phần tử DOM cụ thể mà `RestrictionTarget` được tạo cùng.

Các đối tượng `RestrictionTarget` có thể được tuần tự hóa. Chúng có thể được truyền đến tài liệu khác bằng các cơ chế như {{domxref("Window.postMessage()")}}.

Promise sẽ bị từ chối nếu phần tử restriction target không đủ điều kiện.

## Ví dụ

```js
// Tùy chọn cho getDisplayMedia()
const displayMediaOptions = {
  preferCurrentTab: true,
};

// Tạo restriction target từ phần tử DOM
const demoElem = document.querySelector("#demo");
const restrictionTarget = await RestrictionTarget.fromElement(demoElem);

// Capture luồng video từ webcam của người dùng và tách track video
const stream =
  await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
const [track] = stream.getVideoTracks();

// Giới hạn track video
await track.restrictTo(restrictionTarget);

// Phát luồng bị giới hạn trong phần tử <video>
videoElem.srcObject = stream;
```

Xem [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture) để biết ví dụ mã trong ngữ cảnh.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture)
