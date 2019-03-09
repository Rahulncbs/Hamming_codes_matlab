%%%%% calling mutual information by fragments
%%%% passing all possible strings of a given fragments
close all
clear all
len_str=32;
for l=1:1
for i=1:3
    ref_str=0;
    no_fragments=[1,2,4,8];
    all_possb_str=dec2bin(2^no_fragments(i)-1:-1:0)-'0';
    no_str=length(all_possb_str(:,1));
    t=len_str/no_fragments(i);
    ref_str(1:t)=1;
    for j=1:no_str
        for k=1:no_fragments(i)
            str_a(j,((k-1)*t)+1:k*t)=all_possb_str(j,k)*ref_str;
         end
    end


    %for i=1:4
         [total_mutual_information(l,i),prob_error,prob_convergence,no_all_string, volume_convergence,fraction_con_f]=call_basin_analysis(str_a,no_str);
        
        %[total_mutual_information,prob_error,aa,no_all_string,volume_convergence,basin_radius]=call_basin_analysis(str_a,no_str);

  store_prob_convergence(i,:)=prob_convergence;
    %end
    
  %  mi(j,1:5)=total_mutual_information;
  %%%%%%%%%%%%
    figure
  plot(prob_error,'--*','LineWidth',2);
  hold on
  plot(prob_convergence,'--*','LineWidth',2);
  %%%%%%%%%%%%%%%%%%%%%
  %          set(findobj(gcf,'type','axes'),'FontName','Helvetica','FontSize',12,'FontWeight','Bold', 'LineWidth', 2)
            %xlim([1 5])
            %ylim([0 3])
   %         plot(aa,total_mutual_information,'--*','LineWidth',2);
   %         hold on
        %title('Attractor basin in hamming formalism', 'fontweight','bold','fontsize',12)
   %     xlabel('Number of fragments','fontweight','bold','fontsize',15)
   %     ylabel('K-L Divergence','fontweight','bold','fontsize',15)
end

tt(l)=prob_convergence(max(find(prob_convergence)));
end
