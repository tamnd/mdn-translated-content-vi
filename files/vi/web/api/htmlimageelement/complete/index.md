---
title: "HTMLImageElement: complete property"
short-title: complete
slug: Web/API/HTMLImageElement/complete
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.complete
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`complete`** của giao diện {{domxref("HTMLImageElement")}} là giá trị Boolean cho biết hình ảnh đã được tải hoàn toàn hay chưa.

## Giá trị

Giá trị Boolean là `true` nếu hình ảnh đã được tải hoàn toàn; nếu không thì giá trị là `false`.

Hình ảnh được coi là đã tải hoàn toàn nếu bất kỳ điều nào sau đây là đúng:

- Cả thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/img#src) và [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset) đều không được chỉ định.
- Thuộc tính `srcset` không có và thuộc tính `src`, trong khi được chỉ định, là chuỗi trống (`""`).
- Tài nguyên hình ảnh đã được tìm nạp đầy đủ và được xếp hàng đợi để hiển thị/tổng ​​hợp.
- Phần tử hình ảnh trước đó đã xác định rằng hình ảnh có sẵn đầy đủ và sẵn sàng để sử dụng.
- Hình ảnh bị "hỏng;" nghĩa là hình ảnh không tải được do có lỗi hoặc do quá trình tải hình ảnh bị tắt.

Cần lưu ý rằng do hình ảnh có khả năng được nhận không đồng bộ nên giá trị `complete` có thể thay đổi trong khi tập lệnh của bạn đang chạy.

## Ví dụ

### Chỉ thực hiện các chức năng trên hình ảnh được tải

Hãy xem xét một ứng dụng thư viện ảnh cung cấp khả năng mở hình ảnh ở chế độ hộp đèn để cải thiện khả năng xem cũng như chỉnh sửa hình ảnh. Những ảnh này có thể rất lớn nên bạn không muốn đợi chúng tải nên mã của bạn sử dụng `async`/`await` để tải ảnh ở chế độ nền.

Nhưng hãy tưởng tượng rằng bạn có mã khác chỉ cần chạy khi hình ảnh đã tải xong, chẳng hạn như lệnh thực hiện loại bỏ mắt đỏ trên hình ảnh trong hộp đèn. Mặc dù lý tưởng nhất là lệnh này thậm chí sẽ không được thực thi nếu hình ảnh chưa được tải đầy đủ, nhưng để cải thiện độ tin cậy, bạn nên kiểm tra để đảm bảo trường hợp này xảy ra.

Vì vậy, hàm `fixRedEyeCommand()`, được gọi bằng nút kích hoạt loại bỏ mắt đỏ, sẽ kiểm tra giá trị thuộc tính `complete` của hình ảnh hộp đèn trước khi thử thực hiện công việc của nó. Điều này được thể hiện trong đoạn mã dưới đây.

```js
const lightboxElem = document.querySelector("#lightbox");
const lightboxImgElem = lightboxElem.querySelector("img");
const lightboxControlsElem = lightboxElem.querySelector(".toolbar");

async function loadImage(url, elem) {
  return new Promise((resolve, reject) => {
    elem.onload = () => resolve(elem);
    elem.onerror = reject;
    elem.src = url;
  });
}

async function lightBox(url) {
  lightboxElem.style.display = "block";
  await loadImage("https://some-site.net/huge-image.jpg", lightboxImgElem);
  lightboxControlsElem.disabled = false;
}

// …

function fixRedEyeCommand() {
  if (lightboxElem.style.display === "block" && lightboxImgElem.complete) {
    fixRedEye(lightboxImgElem);
  } else {
    /* can't start doing this until the image is fully loaded */
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
