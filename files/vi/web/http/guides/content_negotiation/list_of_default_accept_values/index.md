---
title: Danh sách các giá trị Accept mặc định
short-title: Giá trị Accept mặc định
slug: Web/HTTP/Guides/Content_negotiation/List_of_default_Accept_values
page-type: guide
sidebar: http
---

Bài viết này ghi lại các giá trị mặc định cho tiêu đề HTTP [`Accept`](/en-US/docs/Web/HTTP/Reference/Headers/Accept) cho các đầu vào và phiên bản trình duyệt cụ thể.

## Giá trị mặc định

Đây là các giá trị được gửi khi ngữ cảnh không cung cấp thông tin tốt hơn.
Lưu ý rằng tất cả các trình duyệt đều thêm loại MIME `*/*` để bao phủ tất cả các trường hợp.
Điều này thường được sử dụng cho các yêu cầu được khởi tạo thông qua thanh địa chỉ của trình duyệt, hoặc thông qua phần tử HTML {{HTMLElement("a")}}.

| User Agent                | Giá trị                                                                                                                                   |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Firefox 132 trở lên [1]   | `text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8`                                                                         |
| Firefox 128 đến 131       | `text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/png,image/svg+xml,*/*;q=0.8`                           |
| Firefox 92 đến 127        | `text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8`                                                   |
| Firefox 72 đến 91 [2]     | `text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8`                                                              |
| Firefox 66 đến 71 [2]     | `text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8`                                                                         |
| Firefox 65 [2]            | `text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8`                                                              |
| Firefox 64 trở xuống [2]  | `text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8`                                                                         |
| Safari 13.1 đến 18.1+ [4] | `text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8`                                                                         |
| Chrome 131+ [4]           | `text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7` |
| Safari, Chrome [4]        | `text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8`                                                   |
| Safari 5 [3]              | `text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8`                                                                         |
| Edge                      | `text/html, application/xhtml+xml, image/jxr, */*`                                                                                        |
| Opera                     | `text/html, application/xml;q=0.9, application/xhtml+xml, image/png, image/webp, image/jpeg, image/gif, image/x-xbitmap, */*;q=0.1`       |

\[1] Giá trị có thể được đặt thành chuỗi tùy ý bằng cách sử dụng tùy chọn `network.http.accept` (`about:config`).

\[2] Giá trị có thể được đặt thành chuỗi tùy ý bằng cách sử dụng tùy chọn [`network.http.accept.default`](https://kb.mozillazine.org/Network.http.accept.default) (`about:config`).

\[3] Đây là cải tiến so với các tiêu đề `Accept` trước đây vì nó không còn xếp hạng `image/png` trên `text/html`.

\[4] Đã kiểm tra lại và thêm giá trị cho Safari 13.1 đến 18.1 và Chrome 131. Các giá trị có thể đã thay đổi trước các phiên bản được chỉ định.

## Giá trị cho hình ảnh

Khi yêu cầu hình ảnh, như thông qua phần tử HTML {{HTMLElement("img")}}, user-agent thường đặt một danh sách cụ thể các loại phương tiện được chào đón.

| User Agent                    | Giá trị                                                                    |
| ----------------------------- | -------------------------------------------------------------------------- |
| Firefox 128 trở lên [1]       | `image/avif,image/webp,image/png,image/svg+xml,image/*;q=0.8,*/*;q=0.5`    |
| Firefox 92 đến 127 [1]        | `image/avif,image/webp,*/*`                                                |
| Firefox 65 đến 91 [1]         | `image/webp,*/*`                                                           |
| Firefox 47 đến 63 [1]         | `*/*`                                                                      |
| Firefox trước 47 [1]          | `image/png,image/*;q=0.8,*/*;q=0.5`                                        |
| Safari (từ Mac OS Big Sur)    | `image/webp,image/png,image/svg+xml,image/*;q=0.8,video/*;q=0.8,*/*;q=0.5` |
| Safari (trước Mac OS Big Sur) | `image/png,image/svg+xml,image/*;q=0.8,video/*;q=0.8,*/*;q=0.5`            |
| Chrome và Edge 121 trở lên    | `image/avif,image/webp,image/apng,image/*,*/*;q=0.8`                       |

\[1] Giá trị có thể được đặt thành chuỗi tùy ý bằng cách sử dụng tham số `image.http.accept` (_[nguồn](https://searchfox.org/firefox-main/search?q=image.http.accept)_).

## Giá trị cho video

Khi video được yêu cầu, thông qua phần tử HTML {{HTMLElement("video")}}, hầu hết trình duyệt sử dụng các giá trị cụ thể.

| User Agent          | Giá trị                                                                            |
| ------------------- | ---------------------------------------------------------------------------------- |
| Firefox 3.6 trở lên | `video/webm,video/ogg,video/*;q=0.9,application/ogg;q=0.7,audio/*;q=0.6,*/*;q=0.5` |
| Firefox trước 3.6   | _không hỗ trợ {{HTMLElement("video")}}_                                            |
| Chrome              | `*/*`                                                                              |

## Giá trị cho tài nguyên âm thanh

Khi tệp âm thanh được yêu cầu, như thông qua phần tử HTML {{HTMLElement("audio")}}, hầu hết trình duyệt sử dụng các giá trị cụ thể.

| User Agent              | Giá trị                                                                                      |
| ----------------------- | -------------------------------------------------------------------------------------------- |
| Firefox 3.6 trở lên [1] | `audio/webm,audio/ogg,audio/wav,audio/*;q=0.9,application/ogg;q=0.7,video/*;q=0.6,*/*;q=0.5` |
| Safari, Chrome          | `*/*`                                                                                        |

\[1] Xem [bug 489071](https://bugzil.la/489071).

## Giá trị cho script

Khi script được yêu cầu, như thông qua phần tử HTML {{HTMLElement("script")}}, một số trình duyệt sử dụng các giá trị cụ thể.

| User Agent     | Giá trị |
| -------------- | ------- |
| Firefox [1]    | `*/*`   |
| Safari, Chrome | `*/*`   |

\[1] Xem [bug 170789](https://bugzil.la/170789).

## Giá trị cho stylesheet CSS

Khi stylesheet CSS được yêu cầu, thông qua phần tử HTML `<link rel="stylesheet">`, hầu hết trình duyệt sử dụng các giá trị cụ thể.

| User Agent     | Giá trị                                                                                                                             |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Firefox 4 [1]  | `text/css,*/*;q=0.1`                                                                                                                |
| Safari, Chrome | `text/css,*/*;q=0.1`                                                                                                                |
| Opera 11.10    | `text/html, application/xml;q=0.9, application/xhtml+xml, image/png, image/webp, image/jpeg, image/gif, image/x-xbitmap, */*;q=0.1` |
| Konqueror 4.6  | `text/css,*/*;q=0.1`                                                                                                                |

\[1] Xem [bug 170789](https://bugzil.la/170789).

## Xem thêm

- [Thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation)
