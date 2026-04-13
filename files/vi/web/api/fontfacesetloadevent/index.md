---
title: FontFaceSetLoadEvent
slug: Web/API/FontFaceSetLoadEvent
page-type: web-api-interface
browser-compat: api.FontFaceSetLoadEvent
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Giao diện **`FontFaceSetLoadEvent`** của [CSS Font Loading API](/en-US/docs/Web/API/CSS_Font_Loading_API) đại diện cho các sự kiện được kích hoạt tại {{domxref("FontFaceSet")}} sau khi nó bắt đầu tải các mặt phông chữ.

Các sự kiện được kích hoạt khi bắt đầu tải phông chữ ([`loading`](/en-US/docs/Web/API/FontFaceSet/loading_event)), khi tải hoàn tất ([`loadingdone`](/en-US/docs/Web/API/FontFaceSet/loadingdone_event)) hoặc khi có lỗi khi tải một trong các phông chữ ([`loadingerror`](/en-US/docs/Web/API/FontFaceSet/loadingerror_event)).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("FontFaceSetLoadEvent.FontFaceSetLoadEvent","FontFaceSetLoadEvent()")}}
  - : Tạo đối tượng `FontFaceSetLoadEvent` mới.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ cha {{domxref("Event")}}_.

- {{domxref("FontFaceSetLoadEvent.fontfaces")}} {{ReadOnlyInline}}
  - : Trả về một mảng các phiên bản {{domxref("FontFace")}}.
    Tùy thuộc vào sự kiện, mảng sẽ chứa các mặt phông chữ đang tải (`loading`), đã tải thành công (`loadingdone`) hoặc tải thất bại (`loadingerror`).

## Phương thức phiên bản

_Kế thừa các phương thức từ cha, {{domxref("Event")}}_.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.fonts")}}
- {{domxref("WorkerGlobalScope.fonts")}}
