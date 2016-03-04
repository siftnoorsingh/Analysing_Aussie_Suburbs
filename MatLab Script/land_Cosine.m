%%Get Features from Raw Data
%%Features: Land Use
Data=[
2.87	23.43	2.22	1.61	2.42	8.31	1.59	5.75	4.73	0.07	6.17	3.17	1.07	1.48	1.19	2.74	4.05	1.84	1.27	6.94	14.21	1.09	1.19	20.79	9.60	5.73	0.00	0.31	10.22	0.00	1.69	0.10	0.00	14.89
0.13	4.11	4.99	2.87	3.30	7.09	1.04	0.00	0.00	0.36	3.28	49.25	19.44	1.17	1.26	15.36	2.75	3.68	0.00	13.89	0.00	2.84	0.37	0.48	0.00	12.02	0.00	0.00	0.00	0.00	0.00	1.31	0.00	0.00
75.45	50.83	12.70	73.06	72.01	42.74	64.70	70.71	83.98	0.02	75.49	33.75	47.52	83.72	81.85	59.59	74.42	16.44	83.63	20.12	71.65	58.49	61.75	44.94	58.54	44.60	59.07	85.22	54.71	63.69	88.07	33.57	48.16	67.75
0.00	0.00	5.48	0.29	0.00	0.00	0.00	0.00	0.00	23.21	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	27.69	0.00	0.00	0.00	0.00	0.22	0.00	0.00	0.00	0.00	39.71	0.00	0.00
21.54	21.64	74.61	22.16	22.26	41.85	32.66	23.54	11.29	76.34	15.07	13.83	31.98	13.62	15.70	22.31	18.78	78.04	15.10	59.06	14.15	9.88	36.69	33.80	31.86	37.64	40.70	14.46	35.06	36.31	10.25	25.31	51.84	17.36

]
DataT = Data'

%%
%%Count the Cosine distance
X=DataT

[mx,nx] = size(X);
Dis = ones(mx,nx);
C = cov(X);
for i=1:mx
for j=1:mx
D(i,j)=1-(X(i,:)*X(j,:)')/sqrt(X(i,:)*X(i,:)'*X(j,:)*X(j,:)');
end
end


%%
%%Use PCA to decrease dimention from 34 to 2
[COEFF,SCORE,latent,tsquare] = pca(D);

important = cumsum(latent)/sum(latent)

tranMix = COEFF(:,1:2)

result = D * tranMix


%%
%%Plot in 2D plane

for i = 1:34

plot(result(i,1),result(i,2),'*')
hold on
    
end

