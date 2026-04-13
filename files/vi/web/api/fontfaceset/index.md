---
title: FontFaceSet
slug: Web/API/FontFaceSet
page-type: web-api-interface
browser-compat: api.FontFaceSet
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Giao diện **`FontFaceSet`** thuộc [CSS Font Loading API](/en-US/docs/Web/API/CSS_Font_Loading_API) quản lý việc tải font face và truy vấn trạng thái tải của chúng.

Một phiên bản `FontFaceSet` là [đối tượng giống `Set`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis) có thể chứa tập hợp có thứ tự các đối tượng {{domxref("FontFace")}}.

Thuộc tính này có thể truy cập qua {{domxref("Document.fonts")}}, hoặc `self.fonts` trong [web worker](/en-US/docs/Web/API/Web_Workers_API).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("FontFaceSet.status")}} {{ReadOnlyInline}}
  - : Cho biết trạng thái tải của font face. Giá trị là `'loading'` hoặc `'loaded'`.
- {{domxref("FontFaceSet.ready")}} {{ReadOnlyInline}}
  - : {{jsxref("Promise")}} resolve khi quá trình tải font và bố cục trang hoàn tất.
- {{domxref("FontFaceSet.size")}} {{ReadOnlyInline}}
  - : Trả về số lượng giá trị trong `FontFaceSet`.

### Sự kiện

- {{domxref("FontFaceSet.loading_event", "loading")}}
  - : Kích hoạt khi tập font face bắt đầu tải.
- {{domxref("FontFaceSet.loadingdone_event", "loadingdone")}}
  - : Kích hoạt khi tập font face tải xong.
- {{domxref("FontFaceSet.loadingerror_event", "loadingerror")}}
  - : Kích hoạt khi có lỗi xảy ra trong quá trình tải tập font face.

## Phương thức phiên bản

- {{domxref("FontFaceSet.add","FontFaceSet.add()")}}
  - : Thêm font vào tập font.
- {{domxref("FontFaceSet.check","FontFaceSet.check()")}}
  - : Giá trị boolean cho biết font đã tải xong chưa, nhưng không khởi động việc tải nếu chưa có.
- {{domxref("FontFaceSet.clear", "FontFaceSet.clear()")}}
  - : Xóa tất cả font được thêm thủ công khỏi tập font. Các font [kết nối với CSS](https://drafts.csswg.org/css-font-loading-3/#css-connected) không bị ảnh hưởng.
- {{domxref("FontFaceSet.delete","FontFaceSet.delete()")}}
  - : Xóa một font được thêm thủ công khỏi tập font. Các font [kết nối với CSS](https://drafts.csswg.org/css-font-loading-3/#css-connected) không bị ảnh hưởng.
- {{domxref("FontFaceSet.entries","FontFaceSet.entries()")}}
  - : Trả về iterator mới với các giá trị của mỗi phần tử trong `FontFaceSet` theo thứ tự chèn.
- {{domxref("FontFaceSet.forEach","FontFaceSet.forEach()")}}
  - : Thực thi hàm được cung cấp cho mỗi giá trị trong đối tượng `FontFaceSet`.
- {{domxref("FontFaceSet.has","FontFaceSet.has()")}}
  - : Trả về {{jsxref("Boolean")}} khẳng định xem phần tử có giá trị đó có tồn tại không.
- {{domxref("FontFaceSet.keys","FontFaceSet.keys()")}}
  - : Bí danh cho {{domxref("FontFaceSet.values()")}}.
- {{domxref("FontFaceSet.load","FontFaceSet.load()")}}
  - : Trả về {{jsxref("Promise")}} resolve với danh sách font face cho font được yêu cầu.
- {{domxref("FontFaceSet.values","FontFaceSet.values()")}}
  - : Trả về iterator mới chứa các giá trị của mỗi phần tử trong đối tượng `FontFaceSet` theo thứ tự chèn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
