function   [CIK] = CIKLookup(ticker);
%CIKLookup
%   INPUT
%   ticker of stock that you would like the SEC CIK number

%%
upper_ticker = upper(ticker);
DOM_File = xmlread(['http://csuite.xbrl.us/php/dispatch.php?Task=xbrlCIKLookup&Ticker=' upper_ticker]);
% 
% 
% addressBookNode = DOM_File.getDocumentElement;
% % Get all the "Entry" nodes
% entries = addressBookNode.getChildNodes;
% % Get the first "Entry"'s children
% % Remember that java arrays are zero-based
% friendlyInfo = entries.item(0).getChildNodes;
% % Iterate over the nodes to find the "PhoneNumber"
% % once there are no more siblinings, "node" will be empty
% node = friendlyInfo.getFirstChild;
% while ~isempty(node)
%     if strcmpi(node.getNodeName, 'CIK')
%         break;
%     else
%         node = node.getNextSibling;
%     end
% end

import javax.xml.xpath.*
factory = XPathFactory.newInstance;
xpath = factory.newXPath;

expression = xpath.compile('//cik');
CIK = expression.evaluate(DOM_File, XPathConstants.STRING);




% % CIK = node.getTextContent;