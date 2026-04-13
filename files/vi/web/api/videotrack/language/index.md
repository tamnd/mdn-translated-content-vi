---
title: "VideoTrack: language property"
short-title: language
slug: Web/API/VideoTrack/language
page-type: web-api-instance-property
browser-compat: api.VideoTrack.language
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`language`** của **{{domxref("VideoTrack")}}** trả về chuỗi xác định ngôn ngữ được sử dụng trong video track.

Đối với các track bao gồm nhiều ngôn ngữ (chẳng hạn như phim tiếng Anh trong đó một vài câu được nói bằng ngôn ngữ khác), đây phải là ngôn ngữ chính của video.

## Giá trị

Chuỗi chỉ định {{glossary("BCP 47 language tag")}} của ngôn ngữ chính được sử dụng trong video track, hoặc chuỗi rỗng (`""`) nếu ngôn ngữ không được chỉ định hoặc không xác định, hoặc nếu track không chứa giọng nói.

Ví dụ, nếu ngôn ngữ chính được sử dụng trong track là tiếng Anh Mỹ, giá trị này sẽ là `"en-US"`. Đối với tiếng Bồ Đào Nha Brazil, giá trị sẽ là `"pt-BR"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
