/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */

public with sharing class TwilioServiceAsyncQueue implements Queueable, Database.AllowsCallouts {
    
    private List<TwilioMessage> twilioMessages;
    
     /* Method: TwilioServiceAsyncQueue
     * Params: List<TwilioMessage>
     * Return: 
     * Description: Constructor for class, sets the messages for queueing callout
     */
    public TwilioServiceAsyncQueue(List<TwilioMessage> messages) {
        System.debug(LoggingLevel.DEBUG, '****TwilioServiceAsyncQueue::TwilioServiceAsyncQueue messages: ' + messages);
        this.twilioMessages = messages;
    }


     /* Method: execute
     * Params: QueueableContext
     * Return: 
     * Description: Executes job in queueable
     */
    public void execute(QueueableContext context) {

        System.debug(LoggingLevel.DEBUG, '****TwilioServiceAsyncQueue::execute context: ' + context);

         for (TwilioMessage msg : twilioMessages) {
            System.debug(LoggingLevel.DEBUG, '****TwilioServiceAsyncQueue::execute msg: ' + msg);
            TwilioMessageResponse status = TwilioHttp.twilioMessage(msg);
            System.debug(LoggingLevel.DEBUG, '****TwilioServiceAsyncQueue::execute status: ' + status);
        }
    }
}