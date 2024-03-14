srcFiles = dir('bloque_images/*.jpg');

num_imagenes = 20;
columnas = 3;
batch_size = 4;
filename_name = 'imagen_bloque_%d.png';

fig = figure;

batch_counter = 0;
batch_id = 0;


clf(fig)

for im_num = 1:num_imagenes

    %Track control over the current batch
    batch_counter = batch_counter+1;

    indx = batch_counter*3-2;

    filename = strcat('bloque_images/',srcFiles(im_num).name);

    I = imread(filename);
    S = edge(I, "sobel");
    C = edge(I, "canny");

    %Plot imagen, sobel, canny

    subplot(batch_size, columnas, indx)
    imshow(I)
    title("Original")

    subplot(batch_size, columnas, indx+1)
    imshow(S)
    title("Sobel")

    subplot(batch_size, columnas, indx+2)
    imshow(C)
    title("Canny")

    if  batch_counter == batch_size

        %filename for each image 
        

        frame = getframe(fig);
        im = frame2im(frame);

        filename_w_id = sprintf(filename_name, batch_id);

        imwrite(im, filename_w_id)

        batch_counter = 0;
        batch_id = batch_id+1;

        clf(fig)

    end

end